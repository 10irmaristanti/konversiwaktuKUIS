import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Convert.dart';
import 'Input.dart';
import 'Result.dart';
import 'Riwayat.dart';
import 'DropdownKonversi.dart';

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
  double _jam = 0;
  double _menit = 0; 
  double _detik = 0;//inisialisasi
  final inputController = TextEditingController(); // memanggil nilai variabel
  String _newValue = "jam"; //inisialisasi
  double _result = 0;
  List<String> listViewItem = List<String>();
  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "jam")
        _result = _inputUser * 1;
      else if (_newValue == "menit")
        _result =  _inputUser * 60;
        else 
        _result = _inputUser *3600;
    });
    listViewItem.add("$_newValue : $_result"); //menampilkan hasil
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      perhitunganSuhu();
    });
  }

  var listItem = ["Jam", "Menit","Detik"]; 

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
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              dropdownKonversi(
                  listItem: listItem,
                  newValue: _newValue,
                  dropdownOnChanged: dropdownOnChanged), 
              Input(inputUserController: inputController),
              dropdownKonversi(
                  listItem: listItem,
                  newValue: _newValue,
                  dropdownOnChanged: dropdownOnChanged),
              Result(result: _result),
              Convert(
                konvertHandler: perhitunganSuhu,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
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
