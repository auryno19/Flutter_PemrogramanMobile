import 'package:flutter/material.dart';

class Suhu extends StatelessWidget {
  const Suhu({
    Key? key,
    required this.selctDropdown,
    required this.NamaSuhu,
    required this.onDropChange,
  }) : super(key: key);

  final String selctDropdown;
  final List<String> NamaSuhu;
  final Function onDropChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: DropdownButton(
          value: selctDropdown,
          isExpanded: true,
          items: NamaSuhu.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            onDropChange(value);
          }),
    );
  }
}
