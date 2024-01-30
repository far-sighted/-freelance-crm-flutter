import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final Widget path;

  const FloatingButton({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => path,
          ),
        );
      },
      iconSize: 32.0,
      icon: const Icon(Icons.add),
    );
  }
}
