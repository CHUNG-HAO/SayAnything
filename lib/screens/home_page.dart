import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.heart_fill,
          color: const Color.fromARGB(255, 206, 73, 73),
          size: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
