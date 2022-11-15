import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  const ConvertButton({
    Key? key,
    required this.konversi,
  }) : super(key: key);

  final Function konversi;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                konversi();
              },
              child: Text(
                "Konversi Suhu",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
