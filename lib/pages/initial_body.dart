import 'package:flutter/material.dart';
class InitialBody extends StatelessWidget {
  const InitialBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'there is no weather 😔 start',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          'searching now 🔍',
          style: TextStyle(
            fontSize: 30,
          ),
        )
      ],
    );
  }
}
