import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: ListView.builder(
          controller: controller,
          itemCount: list.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: 100,
                child: Material(
                  color: Colors.red,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        list = [
                              list[0] - 5,
                              list[0] - 4,
                              list[0] - 3,
                              list[0] - 2,
                              list[0] - 1,
                            ] +
                            list;
                        controller.jumpTo(controller.offset + 500);
                      });
                    },
                    child: Center(child: Text('ajout de machins avant')),
                  ),
                ),
              );
            }
            if (index == list.length + 1) {
              return Container(
                height: 100,
                child: Material(
                  color: Colors.red,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        list = list +
                            [
                              list[list.length - 1] + 1,
                              list[list.length - 1] + 2,
                              list[list.length - 1] + 3,
                              list[list.length - 1] + 4,
                              list[list.length - 1] + 5,
                            ];
                      });
                    },
                    child: Center(child: Text('ajout de machins après')),
                  ),
                ),
              );
            }
            final yolo = list[index - 1];
            return Container(
              key: Key(yolo.toString()),
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              color: yolo % 2 == 0 ? Colors.blue : Colors.white,
              child: Center(child: Text(yolo.toString())),
            );
          },
        ),
      ),
    );
  }
}
