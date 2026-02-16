import 'package:flutter/material.dart';
import 'package:goldy/core/utils/text_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key, required this.text, required this.textColor, required this.fontWeight,
  });
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.textSize30.copyWith(
          color: textColor, fontWeight: fontWeight),
    );
  }
}
