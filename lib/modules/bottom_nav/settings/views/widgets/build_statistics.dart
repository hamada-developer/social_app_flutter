import 'package:flutter/material.dart';

class BuildStatistics extends StatelessWidget {
  final int counter;
  final String title;

  const BuildStatistics({
    Key? key,
    required this.counter,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$counter',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(title),
      ],
    );
  }
}
