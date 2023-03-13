import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';

import 'models/category_context_entity.dart';
import 'models/category_entity.dart';
import 'models/creidt_bill_entity.dart';
import 'repositories/categories_repository.dart';

typedef Success = String;
typedef Error = List<CreditBillEntity>;
String jump = '\n';
final _repository = CategoriesContextRepository();
var letterExcelFormula = '';

Future<Either<Error, Success>> calculo() async {
  List<String?> paths = await _getPaths();
  var date = _getDateFromName(paths.first!);
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

  var listBills =
      (await _getTotalBills(paths)).map((e) => e.toString()).toList();
  var categoriesContext = _repository.listAll();

  int lengthCount = 0;
  for (var category in categoriesContext) {
    listBills.insert(lengthCount,
        '=SUM($letterExcelFormula${54 + lengthCount}:$letterExcelFormula${54 + lengthCount + category.subCategories.length - 1})');
    lengthCount += (category.subCategories.length + 1);
  }

  Clipboard.setData(
      ClipboardData(text: listBills.join(jump).replaceAll('.', ',')));
  return const Right('');
}

List<String> _alfabetyDtoZ() {
  int charA = 'D'.codeUnitAt(0);
  return String.fromCharCodes(Iterable.generate(26, (x) => charA + x))
      .split('');
}

DateTime _getDateFromName(String path) {
  var dateString = RegExp(r'[0-9]{4}-[0-9]{2}').firstMatch(path)!.group(0);
  var dateTime = DateFormat('yyyy-MM').parse(dateString!);
  return dateTime;
}

Future<List<double>> _getTotalBills(List<String?> paths) async {
  List<List<double>> allListsNumbers = [];
  for (var i = 0; i < paths.length; i++) {
    allListsNumbers.add([]);
    var creditBills = await _billsToEntities(paths[i]!);
    final res = _calculeBills(creditBills);
    res.fold((l) => null, (response) {
      for (var e in response) {
        allListsNumbers[i]
            .addAll(e.subCategories.map((e) => e.total.toDouble()).toList());
      }
    });
  }

  List<double> listNumbers = [];

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

  return listNumbers;
}

Future<List<String?>> _getPaths() async {
  FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['csv'],
    allowMultiple: true,
  );
  return pickedFile!.paths;
}

Future<List<CreditBillEntity>> _billsToEntities(String path) async {
  final res = File(path)
      .openRead()
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .where((item) => item.contains(RegExp(r'[0-9]')))
      .map((element) {
    var split = element.split(',');
    split.removeAt(0);
    split.removeAt(0);
    return CreditBillEntity(
      name: split[0],
      valor: num.tryParse(split[1])!,
    );
  });

  return (await res.toList())
      .where((item) => !item.valor.isNegative)
      .where((element) =>
          element.name.toUpperCase() != "Saldo em atraso".toUpperCase())
      .toList();
}

Either<List<CreditBillEntity>, List<CategoryContextEntity>> _calculeBills(
    List<CreditBillEntity> creditBillsEntity) {
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
          return bill.name.toUpperCase().contains(keyWork.toUpperCase());
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
    debugPrint(billsNotFound.map((e) => e.name).join(' - '));
    return Either.left(billsNotFound);
  }

  return Either.right(allCategoriesCandidate);
}
