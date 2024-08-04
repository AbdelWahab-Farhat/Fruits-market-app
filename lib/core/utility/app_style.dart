import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyle {


  static final style14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.poppins().fontFamily,
    color: Colors.black,
  );
  static final style16 = TextStyle(
    fontSize: 16,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final style18 = TextStyle(
    fontSize: 18,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static final style20 = TextStyle(
    fontSize: 20,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const style24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}