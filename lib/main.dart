import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Convert.dart';
import 'Input.dart';
import 'Result.dart';
import 'Riwayat.dart';
import 'DropdownKonversi.dart';
import 'DropdownAtas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0; //inisialisasi awal variabel
  final inputController = TextEditingController(); // memanggil nilai variabel
  String _newValue = "Jam"; // inisialisasi
  String _newValueAtas = "Jam"; //inisialisasi
  double _result = 0; // inisialisasi variabel awal
  List<String> listViewItem = List<String>(); //membuat variabel bertipe list
  List<String> listAtas = ["Jam","Menit","Detik"]; //isi data list
  var listItem = ["Jam", "Menit","Detik"]; //data pada list
  void perhitunganWaktu() { //fungsi perhitungan
    setState(() { //agar bisa di build berulang
      _inputUser = double.parse(inputController.text); //mengkonversi dalam bentuk doble
      if (_newValueAtas == "Jam" && _newValue == "Jam")
        _result = _inputUser * 1;
      else if (_newValueAtas == "Jam" && _newValue == "Menit")
         _result =  _inputUser * 60;
      else if (_newValueAtas == "Jam" && _newValue == "Detik")
      _result = _inputUser *3600;
      else if (_newValueAtas == "Menit" && _newValue == "Jam")
       _result = _inputUser / 60 ;
       else if (_newValueAtas == "Menit" && _newValue == "Menit")
       _result = _inputUser * 1 ;
       else if (_newValueAtas == "Menit" && _newValue == "Detik")
       _result = _inputUser * 60 ;
       else if (_newValueAtas == "Detik" && _newValue == "Jam")
       _result = _inputUser / 3600 ;
       else if (_newValueAtas == "Detik" && _newValue == "Menit")
       _result = _inputUser / 60 ;
       else if (_newValueAtas == "Detik" && _newValue == "Detik")
       _result = _inputUser * 1;
    });
    listViewItem.add("$_newValue : $_result"); //menampilkan hasil
  }

void dropdownOnChangedAtas(String changeValue) { //fungsi dropdown
    setState(() { //agar bisa di build berulang
      _newValueAtas = changeValue; //menyimpan pilihan user 
      perhitunganWaktu(); //memanggil fungsi perhitungan
    });
  }
  
  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      perhitunganWaktu();
    });
  }


  

  @override //fungsi yang nama dan parameternya sama 
  Widget build(BuildContext context) {
    return MaterialApp( //basic app element
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold( //untuk mengatur tata letak
        appBar: AppBar( 
          title: Text("Konverter Waktu"),
        ),
        body: Container( //untuk menampung atribut
          margin: EdgeInsets.all(8), //mengatur jarak dengan widget
          child: Column( //menampung widget sprti colomn,text
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //mengatur colom(vertikal)
            children: [ //array of children
              dropdownAtas( //menjadikan widget lebih sederhana
                  listAtas: listAtas, //parameter
                  newValueAtas: _newValueAtas,
                  dropdownOnChangedAtas: dropdownOnChangedAtas),
              Input(inputUserController: inputController), //menjadikan widget lebih sederhana
              dropdownKonversi(
                  listItem: listItem,
                  newValue: _newValue,
                  dropdownOnChanged: dropdownOnChanged),
              Result(result: _result), //menjadikan widget lebih sederhana
              Convert(
                konvertHandler: perhitunganWaktu,
              ),
              Container( //menampung atribut
                margin: EdgeInsets.only(top: 10, bottom: 10), //mengatur jarak dengan widget
                child: Text( //menampung widget
                  "Riwayat Konversi Waktu",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                //memenuhi ruang kosong
                child: Riwayat(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}