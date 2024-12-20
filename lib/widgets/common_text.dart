import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';

class CommonText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? flow;
  final double? lineHeight;
  final TextDecoration? textDecoration;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  CommonText(
      {@required this.text,
      this.size,
      this.color,
      this.weight,
      this.align,
      this.maxLines,
      this.flow,
      this.lineHeight,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: align,
      maxLines: maxLines,
      overflow: flow,
      style: GoogleFonts.montserrat(
          decoration: textDecoration,
          color: color ?? mainColor,
          fontSize: size ?? FontSize.f14,
          fontWeight: weight ?? FontWeight.w400,
          height: lineHeight ?? 1.4),
    );
  }
}
