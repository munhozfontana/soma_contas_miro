import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

import 'calculo.dart';
import 'widgets/list_bills_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> pathsCredit = [];
  List<String> pathsDebit = [];
  DateTime? selected;

  String? resultado;

  Future<void> submitForm() async {
    if (pathsCredit.isEmpty) {
      return;
    }
    if (selected == null) {
      return displayInfoBar(
        context,
        builder: (context, close) {
          return const InfoBar(
              severity: InfoBarSeverity.warning,
              title: Text(
                'Data Obrigatória',
              ));
        },
      );
    }

    (await importBills(pathsCredit, pathsDebit, selected!)).fold(
      (l) {
        showContentDialog(context, l);
      },
      (r) {
        setState(() {
          resultado = r;
          selected = null;
        });
        displayInfoBar(
          context,
          builder: (context, close) {
            return const InfoBar(
                title: Text(
              'Convertido com sucesso',
            ));
          },
        );
      },
    );
  }

  void showContentDialog(BuildContext context, List<String> errors) async {
    int? indexSelect;
    await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .75,
          maxHeight: MediaQuery.of(context).size.height * .65,
        ),
        title: const Text('Cadastrar as seguintes informações'),
        content: StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return ListView.builder(
                itemCount: errors.length,
                itemBuilder: (context, index) {
                  final error = errors[index];
                  return ListTile.selectable(
                      title: Text(error),
                      selected: indexSelect == index,
                      onSelectionChange: (v) {
                        setState(() {
                          indexSelect = index;
                        });
                      });
                });
          },
        ),
        actions: [
          SizedBox(
            height: 42,
            child: FilledButton(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(FluentIcons.copy),
                    SizedBox(
                      width: 12,
                    ),
                    Text('Copiar'),
                  ],
                ),
              ),
              onPressed: () {
                copyMessage(context, errors.join(jump));
              },
            ),
          ),
          SizedBox(
            height: 42,
            child: FilledButton(
              child: const Center(child: Text('Fechar')),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> copyMessage(BuildContext context, String copyValue) {
    return displayInfoBar(
      context,
      builder: (context, close) {
        Clipboard.setData(ClipboardData(text: copyValue));
        return const InfoBar(
            title: Center(
          child: Text(
            'Copiado',
          ),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(flex: 6),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 32,
                  child: FilledButton(
                      onPressed: resultado != null
                          ? () {
                              copyMessage(context, resultado!);
                            }
                          : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(FluentIcons.copy),
                          Text('Copiar resultado'),
                        ],
                      )),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                flex: 3,
                child: DatePicker(
                  selected: selected,
                  onChanged: (time) => setState(() => selected = time),
                  showDay: false,
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 32,
                  child: FilledButton(
                      onPressed: pathsCredit.isEmpty && pathsDebit.isEmpty
                          ? null
                          : () {
                              submitForm();
                            },
                      child: const Center(child: Text('Calcular'))),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListBillsWidget(
                    title: 'Crédito',
                    subTitle: 'somente arquivo .CSV',
                    onChange: (listPaths) {
                      setState(() {
                        pathsCredit = listPaths;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: ListBillsWidget(
                    title: 'Débito',
                    subTitle: 'somente arquivo .CSV',
                    onChange: (listPaths) {
                      setState(() {
                        pathsDebit = listPaths;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
