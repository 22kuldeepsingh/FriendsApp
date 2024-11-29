import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dimens.dart';

abstract class Styles {
  
  static TextStyle grey12Medium = TextStyle(
    fontFamily:GoogleFonts.manrope().fontFamily,
    color: Color(0xff767C8C),
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w500,
  );

   static TextStyle black12SemiBold = TextStyle(
    fontFamily:GoogleFonts.manrope().fontFamily,
    color: Colors.black,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w600,
  );

   static TextStyle black14SemiBold = TextStyle(
    fontFamily:GoogleFonts.manrope().fontFamily,
    color: Colors.black,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle black20SemiBold = TextStyle(
    fontFamily:GoogleFonts.manrope().fontFamily,
    color: Colors.black,
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w600,
  );

  static TextStyle black20Bold = TextStyle(
    fontFamily:GoogleFonts.manrope().fontFamily,
    color: Colors.black,
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w700,
  );

  static TextStyle red20Bold = TextStyle(
    fontFamily:GoogleFonts.manrope().fontFamily,
    color: Colors.red,
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w700,
  );
}