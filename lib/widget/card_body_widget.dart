import 'dart:math';

import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody({
    Key? key,
    required this.item,
    required this.handleDelete,
    required this.index,
  }) : super(key: key);

  var index;
  var item;
  final Function handleDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: (index % 2 == 0)
            ? Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256))
            : Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff4B4B4B),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              item.time,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
            ),
          ],
        ),
      ),
    );
  }
}
