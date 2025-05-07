import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_adopted_app/theme/colour.dart';

class TextApp {
  static TextStyle heading = GoogleFonts.nunito(
      fontSize: 20, fontWeight: FontWeight.bold, color: black);
  static TextStyle headingY = GoogleFonts.nunito(
      fontSize: 20, fontWeight: FontWeight.bold, color: yellow);
  static TextStyle h1 = GoogleFonts.nunito(
      fontSize: 26, fontWeight: FontWeight.w700, color: black);
  static TextStyle h2 = GoogleFonts.nunito(
      fontSize: 18, fontWeight: FontWeight.w700, color: black);
  static TextStyle h3 = GoogleFonts.nunito(
      fontSize: 16, fontWeight: FontWeight.w700, color: black);
  static TextStyle reguler = GoogleFonts.nunito(
      fontSize: 16, fontWeight: FontWeight.w400, color: black);
  static TextStyle regulerS = GoogleFonts.nunito(
      fontSize: 14, fontWeight: FontWeight.w300, color: black);
  static TextStyle regulerLink = GoogleFonts.nunito(
      fontSize: 16, fontWeight: FontWeight.w400, color: blue);
}

class TextW {
  static TextStyle heading = GoogleFonts.nunito(
      fontSize: 20, fontWeight: FontWeight.bold, color: white);
  static TextStyle headingY = GoogleFonts.nunito(
      fontSize: 20, fontWeight: FontWeight.bold, color: yellow);
  static TextStyle h1 = GoogleFonts.nunito(
      fontSize: 26, fontWeight: FontWeight.w700, color: white);
  static TextStyle h2 = GoogleFonts.nunito(
      fontSize: 18, fontWeight: FontWeight.w700, color: white);
  static TextStyle h3 = GoogleFonts.nunito(
      fontSize: 16, fontWeight: FontWeight.w700, color: white);
  static TextStyle reguler = GoogleFonts.nunito(
      fontSize: 16, fontWeight: FontWeight.w400, color: white);
  static TextStyle regulerS = GoogleFonts.nunito(
      fontSize: 14, fontWeight: FontWeight.w300, color: white);
  static TextStyle regulerLink = GoogleFonts.nunito(
      fontSize: 16, fontWeight: FontWeight.w400, color: baseColour);
}

// Optional font weight constants (bisa tetap digunakan di bagian lain)
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
