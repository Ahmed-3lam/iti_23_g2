import 'package:flutter/material.dart';

class CustomChats extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? countMessages;

  const CustomChats({
    super.key,
    required this.icon,
    required this.text,
    this.countMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.green,
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (countMessages != null) const Spacer(),
        if (countMessages != null)
          Text(
            countMessages!,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
