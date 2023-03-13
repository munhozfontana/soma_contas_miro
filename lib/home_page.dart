import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<XFile> _list = [];

  bool _dragging = false;

  Future<void> _dialogBuilder(
      BuildContext context, String text, String planilha) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajustar: Planilha $planilha'),
          content: SelectableText(text),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var textStyles = Theme.of(context).textTheme;
    var child = Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Arraste excel do crédito',
                style: textStyles.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'somente arquivo .CSV',
                style: textStyles.labelSmall,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: double.maxFinite,
            height: 250,
            decoration: BoxDecoration(
              color: _dragging
                  ? const Color.fromARGB(255, 224, 224, 224)
                  : Colors.white,
              boxShadow: kElevationToShadow[2],
              borderRadius: BorderRadius.circular(14),
            ),
            child: DropTarget(
              onDragDone: (detail) {
                setState(() {
                  _list.addAll(detail.files);
                });
              },
              onDragEntered: (detail) {
                setState(() {
                  _dragging = true;
                });
              },
              onDragExited: (detail) {
                setState(() {
                  _dragging = false;
                });
              },
              child: _list.isEmpty
                  ? Center(
                      child: Text(
                      "solte aqui",
                      style: textStyles.bodyMedium,
                    ))
                  : Center(
                      child: Text(
                      "${_list.length} Arquivo(s)",
                      style: textStyles.bodyMedium,
                    )),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Arquivos',
            style: textStyles.labelSmall,
          ),
          const SizedBox(height: 18),
          Flexible(
              child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: kElevationToShadow[2],
                ),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      _list.removeAt(index);
                    });
                  },
                  title: Text(_list[index].name),
                  trailing: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 6),
            itemCount: _list.length,
          )),
        ],
      ),
    );
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .45,
              height: MediaQuery.of(context).size.height * .60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: kElevationToShadow[24],
                borderRadius: BorderRadius.circular(14),
              ),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
