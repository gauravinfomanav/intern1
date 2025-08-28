import 'package:flutter/material.dart';

class AutoSizeText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? minFontSize;
  final double? maxFontSize;

  const AutoSizeText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.minFontSize,
    this.maxFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate font size based on screen width
        double screenWidth = MediaQuery.of(context).size.width;
        double fontSize = (screenWidth * 0.04).clamp(
          minFontSize ?? 12.0,
          maxFontSize ?? 24.0,
        );

        return Text(
          text,
          style: (style ?? const TextStyle()).copyWith(fontSize: fontSize),
          textAlign: textAlign,
          maxLines: maxLines,
        );
      },
    );
  }
}
