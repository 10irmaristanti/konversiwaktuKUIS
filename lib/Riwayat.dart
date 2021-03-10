import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Riwayat extends StatelessWidget {
  const Riwayat({
    Key key,
    @required this.listViewItem,
  }) : super(key: key);

  final List<String> listViewItem;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: listViewItem.map((String value) { //iterasi setiap item dari list
      return Container(
          margin: EdgeInsets.all(10),
          child: Text(
            value,
            style: TextStyle(fontSize: 15),
          ));
    }).toList());
  }
}