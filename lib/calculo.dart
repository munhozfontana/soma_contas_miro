import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';

import 'exceptions/Business_exception.dart';
import 'models/category_context_entity.dart';
import 'models/category_entity.dart';
import 'models/creidt_bill_entity.dart';
import 'repositories/categories_repository.dart';

typedef Success = String;
typedef Error = List<CreditBillEntity>;

var initAt = 56;
String jump = '\n';
final _repository = CategoriesContextRepository();
List<String> _ignoreWordsDebit = [
  'Transferência enviada pelo Pix - Istefani França Costa - •••.802.001-•• - NU PAGAMENTOS - IP (0260) Agência: 1 Conta: 3157037-9',
  'Pagamento de fatura',
  'Transferência enviada pelo Pix',
  'Transferência enviada - Luís Fernando Munhoz Fontana Neto - •••.016.141-•• - Easynvest - Título Corretora de Valores SA (0140) Agência: 1 Conta: 6166196-0',
  'Transferência enviada - Istefani Franca Costa  - •••.802.001-•• - Easynvest - Título Corretora de Valores SA (0140) Agência: 1 Conta: 975547-7',
];

List<String> _ignoreWordsCredit = [
  'Pagamento recebido',
  "Crédito de atraso",
  "Pagamento de Fatura",
];

Future<Either<BusinessException, String>> importBills(
    List<String> pathsCredit, List<String> pathsDebit, DateTime date) async {
  List<String> resCredit = [];
  List<String> resDebit = [];
  try {
    if (pathsCredit.isNotEmpty) {
      resCredit = await _importCreditByPaths(pathsCredit, date);
    }

    if (pathsDebit.isNotEmpty) {
      resDebit = await _importDebitByPaths(pathsDebit, date);
    }

    final res = resCredit.mapWithIndex((t, i) {
      if (t.contains('SUM')) {
        return t;
      }

      if (resDebit.isNotEmpty) {
        return '${num.parse(t) + num.parse(resDebit[i])}';
      }
      return t;
    }).toList();

    var resultExcel = res.join(jump).replaceAll('.', ',');
    Clipboard.setData(ClipboardData(text: resultExcel));
    return Right(resultExcel);
  } on BusinessException catch (e) {
    return Left(e);
  }
}

Future<List<String>> _importCreditByPaths(
    List<String> paths, DateTime date) async {
  final bills = (await _getTotalBills(paths, _billsCreditToEntities));
  return (await calculo(bills, date, _getLetterByDate(date)));
}

Future<List<String>> _importDebitByPaths(
    List<String> paths, DateTime date) async {
  final bills = (await _getTotalBills(paths, _billsDebitToEntities));
  return (await calculo(bills, date, _getLetterByDate(date)));
}

Future<List<String>> calculo(
  List<String> listBills,
  DateTime date,
  String letterExcelFormula,
) async {
  _getLetterByDate(date);

  var categoriesContext = _repository.listAll();

  int lengthCount = 0;
  for (var category in categoriesContext) {
    listBills.insert(
      lengthCount,
      '=SUM($letterExcelFormula${initAt + lengthCount}:$letterExcelFormula${initAt + lengthCount + category.subCategories.length - 1})',
    );
    lengthCount += (category.subCategories.length + 1);
  }

  return listBills;
}

String _getLetterByDate(DateTime date) {
  var letterExcelFormula = '';
  var alfabety = _alfabetyDtoZ();
  var countEven = 0;
  for (var i = 0; i < alfabety.length; i++) {
    if (i.isEven) {
      countEven++;
      if (date.month == countEven) {
        letterExcelFormula = alfabety[i];
      }
    }
  }

  return letterExcelFormula;
}

Future<List<String>> _getTotalBills(
  List<String?> paths,
  Future<List<CreditBillEntity>> Function(String path) toEntity,
) async {
  List<List<double>> allListsNumbers = [];
  for (var i = 0; i < paths.length; i++) {
    allListsNumbers.add([]);
    var creditBills = await toEntity(paths[i]!);
    final res = _calculeBills(
        creditBills, paths[i]!.split(Platform.pathSeparator).last);
    for (var e in res) {
      allListsNumbers[i].addAll(
        e.subCategories.map((e) => e.total.toDouble()).toList(),
      );
    }
  }

  List<double> listNumbers = [];

  for (var i = 0; i < allListsNumbers.length; i++) {
    print(paths[i]);
    print(allListsNumbers[i].reduce((value, element) => value + element));
    print("###########\n");
  }
  for (var i = 0; i < allListsNumbers.length; i++) {
    if (listNumbers.isEmpty) {
      listNumbers.addAll(List.generate(
        allListsNumbers[i].length,
        (index) => 0,
      ));
    }
    for (var j = 0; j < listNumbers.length; j++) {
      listNumbers[j] += allListsNumbers[i][j];
    }
  }

  return listNumbers
      .map(
        (e) => e.toString(),
      )
      .toList();
}

Future<List<CreditBillEntity>> _billsCreditToEntities(String path) async {
  return _billsToEntities(
    path: path,
    indexValue: 3,
    indexName: 2,
    ignoreWords: _ignoreWordsCredit,
  );
}

Future<List<CreditBillEntity>> _billsDebitToEntities(String path) async {
  return _billsToEntities(
    path: path,
    indexValue: 1,
    indexName: 3,
    ignoreWords: _ignoreWordsDebit,
    isDebit: true,
  );
}

Future<List<CreditBillEntity>> _billsToEntities({
  required String path,
  required int indexName,
  required int indexValue,
  required List<String> ignoreWords,
  bool isDebit = false,
}) async {
  final res = File(path)
      .openRead()
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .where((item) => item.contains(RegExp(r'[0-9]')))
      .map((item) => item.split(','))
      .map((item) {
    return CreditBillEntity(
      name: item[indexName],
      valor: num.tryParse(item[indexValue])!,
    );
  });

  var list = (await res.toList());

  if (isDebit) {
    list = list.where((element) {
      if (isDebit) {
        return element.valor.isNegative;
      }
      return true;
    }).map((e) {
      if (e.valor.isNegative) {
        return e.copyWith(valor: e.valor * -1);
      }
      return e;
    }).toList();
  }

  return list
      .where((element) => !ignoreWords.any((ignore) {
            if (element.name.toUpperCase() == ignore.toUpperCase()) {
              print(element.name.toUpperCase());
              print(ignore.toUpperCase());
              print('${element.name.toUpperCase() == ignore.toUpperCase()}');
              print('####');
            }

            return element.name.toUpperCase() == ignore.toUpperCase();
          }))
      .toList();
}

List<CategoryContextEntity> _calculeBills(
    List<CreditBillEntity> creditBillsEntity, String fileName) {
  var allCategories = _repository.listAll();
  var allCategoriesCandidate = allCategories;
  var billsNotFound = <CreditBillEntity>[];

  for (var bill in creditBillsEntity) {
    int points = 0;
    CategoryEntity? categoryCandidate;
    CategoryContextEntity? categoryContextEntityCandidate;

    for (var categoryContext in allCategories) {
      for (var category in categoryContext.subCategories) {
        final findPoint = category.keyWordsToFind.where((keyWork) {
          return bill.name
              .toUpperCase()
              .trim()
              .contains(keyWork.toUpperCase().trim());
        }).length;

        if (points < findPoint) {
          points = findPoint;
          categoryCandidate = category;
          categoryContextEntityCandidate = categoryContext;
        }
      }

      if (allCategories.last.id == categoryContext.id) {
        if (categoryCandidate != null && points > 0) {
          for (var element in allCategoriesCandidate) {
            if (categoryContextEntityCandidate == element) {
              for (var category
                  in categoryContextEntityCandidate!.subCategories) {
                if (categoryCandidate == category) {
                  category.total += bill.valor;
                }
              }
            }
          }
        } else {
          billsNotFound.add(bill);
        }
      }
    }
  }

  if (billsNotFound.isNotEmpty) {
    var list = billsNotFound.map((e) => '${e.name}\n${e.valor}').toList();

    throw BusinessException(
      error: list,
      fileName: fileName,
    );
  }

  return allCategoriesCandidate;
}

//  UTILS
List<String> _alfabetyDtoZ() {
  int charA = 'D'.codeUnitAt(0);
  return String.fromCharCodes(Iterable.generate(26, (x) => charA + x))
      .split('');
}
