import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String padNumber;
  final void Function() onTap;
  final Color? color;
  const CircleButton({
    super.key,
    required this.padNumber,
    required this.onTap,
    this.color = Colors.deepOrange,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Ink(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              padNumber,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
