import 'package:flutter/material.dart';
import 'package:revbank/widgets/text.dart';

class MyAppButton extends StatelessWidget {
  const MyAppButton({
    super.key,
    this.text,
    this.color,
    this.borderColor = Colors.transparent,
    this.textColor,
    this.press,
    this.transparent = false,
    this.width,
    this.height,
    this.enabled = false,
  });

  final String? text;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final VoidCallback? press;
  final bool transparent;
  final double? width;
  final double? height;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 550),
        width: width ?? (transparent ? null : double.infinity),
        height: height ?? (transparent ? null : 55),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor!),
            borderRadius: BorderRadius.circular(16),
            color: color),
        child: TextButton(
          onPressed: enabled ? press : null,
          child: AppText.button(
            text ?? "",
            color: textColor,
          ),
        ),
      ),
    );
  }
}
