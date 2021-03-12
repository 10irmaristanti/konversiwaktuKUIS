import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Result extends StatelessWidget {
  const Result({ //konstruktor
    Key key,
    @required this.result, //isi parameter konstruktor
  }) : super(key: key); //inisialisasi sebagai subclass main
  final double result; //deklarasi variabel pada konstruktor
  @override //fungsi yang nama dan parameternya sama
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hasil",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            result.toStringAsFixed(1), //menampilkan hasil agar nilai 0 dibelakang koma ada 1
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
    // );
  }
}
