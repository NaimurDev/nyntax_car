import 'package:flutter/material.dart';

class MandatoryFormLabel extends StatelessWidget {
  final String text;
  const MandatoryFormLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.titleMedium,
        children: const <TextSpan>[
          TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
