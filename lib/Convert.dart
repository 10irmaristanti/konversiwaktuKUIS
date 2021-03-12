import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Convert extends StatelessWidget {
  final Function konvertHandler;
  Convert({Key key, @required this.konvertHandler});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //agar lebar button penuh kesamping
      height: 50,
      child: RaisedButton( //membuat button
        onPressed: konvertHandler, //agar button bisa diklik
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Konversi Suhu"),
      ),
    );
  }
}
