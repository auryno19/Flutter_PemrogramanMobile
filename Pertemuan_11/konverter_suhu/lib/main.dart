import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController text1 = TextEditingController();
  double kelvin = 0, reamor = 0, input = 0;

  konversi() {
    setState(() {
      input = double.parse(text1.text);
      kelvin = input + 273;
      reamor = input * 4 / 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Konversi Suhu')),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputSuhu(text1: text1),
              Hasil(kelvin: kelvin, reamor: reamor),
              konvertButton(text1: text1, konversi: konversi)
            ],
          ),
        ),
      ),
    );
  }
}

class konvertButton extends StatelessWidget {
  konvertButton({
    Key? key,
    required this.text1,
    required this.konversi,
  }) : super(key: key);

  final TextEditingController text1;
  final Function konversi;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          konversi();
          text1.clear();
        },
        child: Text(
          "Konversi",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class inputSuhu extends StatelessWidget {
  const inputSuhu({
    Key? key,
    required this.text1,
  }) : super(key: key);

  final TextEditingController text1;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: text1,
        decoration: InputDecoration(hintText: "Masukkan Suhu"),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ]);
  }
}

class Hasil extends StatelessWidget {
  const Hasil({
    Key? key,
    required this.kelvin,
    required this.reamor,
  }) : super(key: key);

  final double kelvin;
  final double reamor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text('Suhu dalam \nReamur',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Text(
                "$reamor",
                style: const TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text(
                'Suhu dalam \nKelvin',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                "$kelvin",
                style: const TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
      ],
    );
  }
}
