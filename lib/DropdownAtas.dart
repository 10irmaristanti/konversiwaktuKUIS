import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class dropdownAtas extends StatelessWidget {
  const dropdownAtas({
    Key key,
    @required this.listAtas,
    @required String newValueAtas,
    @required this.dropdownOnChangedAtas,
  }) : _newValueAtas = newValueAtas, super(key: key);

  final List<String> listAtas;
  final String _newValueAtas;
  final Function dropdownOnChangedAtas;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listAtas.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValueAtas,
      onChanged: dropdownOnChangedAtas,
    );
  }
}