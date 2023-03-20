import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';

class ListBillsWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  final Function(List<String>)? onChange;

  const ListBillsWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    this.onChange,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListBillsWidgetState();
}

class _ListBillsWidgetState extends State<ListBillsWidget> {
  final List<XFile> _list = [];

  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    var textStyles = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kElevationToShadow[24],
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTitle(textStyles),
              const SizedBox(height: 24),
              Expanded(child: buildDrag(textStyles)),
              Visibility(
                maintainSize: false,
                visible: _list.isNotEmpty,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Arquivos',
                      style: textStyles.labelLarge,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: kThemeAnimationDuration,
                curve: Curves.easeOutCubic,
                height: _list.isNotEmpty ? 200 : 0,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _list[index].name,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _list.removeAt(index);
                                  widget.onChange
                                      ?.call(_list.map((e) => e.path).toList());
                                });
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 6),
                  itemCount: _list.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container buildDrag(TextTheme textStyles) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color:
            _dragging ? const Color.fromARGB(255, 224, 224, 224) : Colors.white,
        boxShadow: kElevationToShadow[2],
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropTarget(
        onDragDone: (detail) {
          setState(() {
            _list.addAll(detail.files.where((newFile) {
              return !_list.any((oldFile) => newFile.path == oldFile.path);
            }));
            widget.onChange?.call(_list.map((e) => e.path).toList());
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
    );
  }

  Column buildTitle(TextTheme textStyles) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          widget.title,
          style: textStyles.titleLarge,
        ),
        Text(
          widget.subTitle,
          style: textStyles.labelLarge,
        ),
      ],
    );
  }
}
