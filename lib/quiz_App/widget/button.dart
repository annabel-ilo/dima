import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget( {
    Key? key,
    required this.selectHandler,
    required this.answerText,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final selectHandler;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      height: 50,
      width: 250,
      child: ElevatedButton(
        style: btnStyle(),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }

  ButtonStyle btnStyle() {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(8),
      primary: Colors.brown.shade600,
      // fixedSize: const Size(
      //   250,
      //   50,
      // ),
    );
  }
}
