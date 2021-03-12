import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({ //konstruktor
    Key key,
    @required this.inputUserController, //isi parameter konstruktor
  }) : super(key: key); //inisialisasi sebagi subclass main

  final TextEditingController inputUserController; //deklarasi konstruktor untuk controller

  @override //fungsi yang nama dan parameternya sama 
  Widget build(BuildContext context) {
    return TextFormField( //form inputan
      controller: inputUserController, //untuk menerima inputan user
        decoration: InputDecoration( 
          hintText: 'Masukkan jumlah waktu',
        ),
        keyboardType: TextInputType.numberWithOptions(), //agar keyboard langsung memunmuculkan angka
        validator: (String value) { //memvalidasi inputan user
          if (value.isEmpty) { // kondisi
            return 'Enter some text';
          }
          return null;
        });
  }
}

