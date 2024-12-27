import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String label;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? lineHeight;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final String? fontFamily;
  final TextStyle? textStyle;

  const LabelWidget({
    Key? key,
    required this.label,
    this.color,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.lineHeight,
    this.letterSpacing,
    this.textAlign = TextAlign.start,
    this.fontFamily,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: textStyle ??
          TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: FontStyle.normal,
            height: lineHeight,
            letterSpacing: letterSpacing,
          ),
    );
  }
}
