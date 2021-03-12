import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class dropdownKonversi extends StatelessWidget {
  const dropdownKonversi({
    Key key,
    @required this.listItem, //isi parameter konstruktor
    @required String newValue,
    @required this.dropdownOnChanged,
  }) : _newValue = newValue, super(key: key); //deklarasi agar bisa memanggil variabel class main

  final List<String> listItem; //deklarasi variabel tipe data array
  final String _newValue;  //deklarasi variabel tipe data string
  final Function dropdownOnChanged; //deklarasi fungsi

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>( //memanggil dropdown main
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),//membuat list dari listview yang berurutan 
      value: _newValue,
      onChanged: dropdownOnChanged, //agar dropdown bisa berganti pilihan
    );
  }
}