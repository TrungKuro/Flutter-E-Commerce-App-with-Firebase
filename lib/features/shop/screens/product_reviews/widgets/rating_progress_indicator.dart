import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ERatingProgressIndicator extends StatelessWidget {
  const ERatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 15,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10,
            backgroundColor: EColors.grey,
            valueColor: const AlwaysStoppedAnimation(EColors.primary),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
