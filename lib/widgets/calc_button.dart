import 'package:flutter/material.dart';

enum CalcButtonType { number, operatorBtn, function, equals }

class CalcButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final CalcButtonType type;

  const CalcButton({
    super.key,
    required this.label,
    required this.onTap,
    this.type = CalcButtonType.number,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    late final Color backgroundColor;
    late final Color textColor;

    switch (type) {
      case CalcButtonType.number:
        backgroundColor = colorScheme.surfaceContainerHighest;
        textColor = colorScheme.onSurface;
        break;
      case CalcButtonType.function:
        backgroundColor = colorScheme.secondaryContainer;
        textColor = colorScheme.onSecondaryContainer;
        break;
      case CalcButtonType.operatorBtn:
        backgroundColor = colorScheme.primaryContainer;
        textColor = colorScheme.onPrimaryContainer;
        break;
      case CalcButtonType.equals:
        backgroundColor = colorScheme.primary;
        textColor = colorScheme.onPrimary;
        break;
    }

    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        color: backgroundColor,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
