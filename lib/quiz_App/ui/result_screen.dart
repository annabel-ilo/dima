import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.resultScore,
  }) : super(key: key);

  final int resultScore;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("You did it!"),
    );
  }
}
