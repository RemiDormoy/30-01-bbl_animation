import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Item> list = [
    Item(1, Random().nextInt(150) + 50),
    Item(2, Random().nextInt(150) + 50),
    Item(3, Random().nextInt(150) + 50),
    Item(4, Random().nextInt(150) + 50),
    Item(5, Random().nextInt(150) + 50),
    Item(6, Random().nextInt(150) + 50),
    Item(7, Random().nextInt(150) + 50),
    Item(8, Random().nextInt(150) + 50),
    Item(9, Random().nextInt(150) + 50),
    Item(10, Random().nextInt(150) + 50),
  ];
  List<Item> pastItems = [];
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Center(child: Text('Bonjour je suis une tabBar')),
            ),
            Expanded(
              child: CustomScrollView(
                center: centerKey,
                slivers: [
                  SliverList(
                    delegate:
                        SliverChildBuilderDelegate(childCount: pastItems.length + 1, (BuildContext context, int index) {
                      return _itemPast(index, context);
                    }),
                  ),
                  SliverList(
                    key: centerKey,
                    delegate:
                        SliverChildBuilderDelegate(childCount: list.length + 1, (BuildContext context, int index) {
                      return _itemFuture(index, context);
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _itemPast(int index, BuildContext context) {
    if (index == pastItems.length) {
      return Container(
        height: 100,
        child: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              setState(() {
                var pastId = pastItems.isNotEmpty ? pastItems[pastItems.length - 1].id : 1;
                pastItems = pastItems +
                    [
                      Item(pastId - 1, Random().nextInt(150) + 50),
                      Item(pastId - 2, Random().nextInt(150) + 50),
                      Item(pastId - 3, Random().nextInt(150) + 50),
                      Item(pastId - 4, Random().nextInt(150) + 50),
                      Item(pastId - 5, Random().nextInt(150) + 50),
                    ];
              });
            },
            child: Center(child: Text('ajout de machins avant')),
          ),
        ),
      );
    }
    final yolo = pastItems[index];
    return Container(
      height: yolo.height.toDouble(),
      width: MediaQuery.sizeOf(context).width,
      color: yolo.id % 2 == 0 ? Colors.blue : Colors.white,
      child: Center(child: Text(yolo.id.toString())),
    );
  }

  Container _itemFuture(int index, BuildContext context) {
    if (index == list.length) {
      return Container(
        height: 100,
        child: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              setState(() {
                list = list +
                    [
                      Item(list[list.length - 1].id + 1, Random().nextInt(150) + 50),
                      Item(list[list.length - 1].id + 2, Random().nextInt(150) + 50),
                      Item(list[list.length - 1].id + 3, Random().nextInt(150) + 50),
                      Item(list[list.length - 1].id + 4, Random().nextInt(150) + 50),
                      Item(list[list.length - 1].id + 5, Random().nextInt(150) + 50),
                    ];
              });
            },
            child: Center(child: Text('ajout de machins après')),
          ),
        ),
      );
    }
    final yolo = list[index];
    return Container(
      height: yolo.height.toDouble(),
      width: MediaQuery.sizeOf(context).width,
      color: yolo.id % 2 == 0 ? Colors.blue : Colors.white,
      child: Center(child: Text(yolo.id.toString())),
    );
  }
}

class Item {
  final int id;
  final int height;

  Item(this.id, this.height);
}

final centerKey = GlobalKey();
