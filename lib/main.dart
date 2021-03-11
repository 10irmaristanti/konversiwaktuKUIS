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
  double _inputUser = 0;
  // double _jam = 0;
  // double _menit = 0;
  // double _detik =0; //inisialisasi
  final inputController = TextEditingController(); // memanggil nilai variabel
  String _newValue = "Jam";
  String _newValueAtas = "Jam"; //inisialisasi
  double _result = 0;
  List<String> listViewItem = List<String>();
  List<String> listAtas = ["Jam","Menit","Detik"];
  List<String> listWaktu = List <String>();
  void perhitunganWaktu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
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

void dropdownOnChangedAtas(String changeValue) {
    setState(() {
      _newValueAtas = changeValue;
      perhitunganWaktu();
    });
  }
  
  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      perhitunganWaktu();
    });
  }


  var listItem = ["Jam", "Menit","Detik"]; //data nilai

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Waktu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              dropdownAtas(
                  listAtas: listAtas,
                  newValueAtas: _newValueAtas,
                  dropdownOnChangedAtas: dropdownOnChangedAtas),
              Input(inputUserController: inputController),
              dropdownKonversi(
                  listItem: listItem,
                  newValue: _newValue,
                  dropdownOnChanged: dropdownOnChanged),
              Result(result: _result),
              Convert(
                konvertHandler: perhitunganWaktu,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
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