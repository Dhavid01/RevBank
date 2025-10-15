import 'package:flutter/material.dart';
import 'package:revbank/core/utils/text_style.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool multiText;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final Color? color;
  final bool centered;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? lineHeight;

  /// biggest text
  ///
  /// fontSize `28`
  /// fontWeight `700`
  AppText.heading1(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.lineHeight,
    this.wordSpacing,
    this.fontWeight,
  }) : style = headingStyle1.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  /// h2 text
  ///
  // fontSize `24`
  // fontWeight `700`
  AppText.heading2(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  }) : style = headingStyle2.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  /// h3 text
  ///
  /// fontSize `20`
  /// fontWeight `700`
  AppText.heading3(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.wordSpacing,
    this.lineHeight,
    this.letterSpacing,
    this.fontWeight,
  }) : style = headingStyle3.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  /// h4text
  //
  // / fontSize `18`
  // / fontWeight `700`
  AppText.heading4(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.lineHeight,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.fontWeight,
  }) : style = headingStyle4.copyWith(
          color: color,
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          fontWeight: fontWeight,
          overflow: overflow,
        );

  /// fontSize `16`
  /// fontWeight `700`
  AppText.button(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  }) : style = buttonStyle.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
        );

  /// label regular
  ///
  /// fontSize
  AppText.labelRegular(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  }) : style = labelRegularStyle.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  /// display regular
  ///
  /// fontSize
  AppText.displayRegular(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  }) : style = displayRegularStyle.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  /// display semibold regular
  ///
  /// fontSize
  AppText.displaySemiBold(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  }) : style = displaySemiBoldStyle.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  /// label regular
  ///
  /// fontSize
  AppText.bodyRegular(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  }) : style = bodyRegularStyle.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  /// dsipaly bold
  ///
  /// fontSize
  AppText.displayBold(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  }) : style = displayBoldStyle.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  /// label regular
  ///
  /// fontSize
  AppText.contentRegular(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  }) : style = contentRegularStyle.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  /// label regular
  ///
  /// fontSize
  AppText.labelBold(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  }) : style = labelBoldStyle.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  /// label regular
  ///
  /// fontSize
  AppText.contentBold(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  }) : style = contentBoldStyle.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  /// label regular
  ///
  /// fontSize
  AppText.samllRegular(
    this.text, {
    super.key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  }) : style = smallRegularStyle.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: multiText || maxLines != null ? maxLines ?? 9999999999 : 1,
      overflow: overflow,
      textAlign: centered ? TextAlign.center : textAlign ?? TextAlign.left,
      style: style.copyWith(
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: TextDecoration.none,
        color: color ?? Colors.black,
        height: lineHeight,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
