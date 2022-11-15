import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputUser extends StatelessWidget {
  const InputUser({
    Key? key,
    required this.input_user,
  }) : super(key: key);

  final TextEditingController input_user;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: input_user,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(labelText: "Celcius"),
    );
  }
}
