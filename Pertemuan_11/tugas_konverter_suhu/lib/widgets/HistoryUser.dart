import 'package:flutter/material.dart';

class HistoryUser extends StatelessWidget {
  const HistoryUser({
    Key? key,
    required this.history,
  }) : super(key: key);

  final List<String> history;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              return Text(history[index]);
            }));
  }
}
