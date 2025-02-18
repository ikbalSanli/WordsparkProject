import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleClass{ 
  // static TextStyle mainTitle =TextStyle(
  //           fontWeight: FontWeight.w900,
  //           letterSpacing: 0.5,
  //           color: Colors.black,
  //           fontSize: 30
  //         );
static TextStyle mainTitle = GoogleFonts.notoSerif( fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black);
  // static TextStyle mainContent = TextStyle(
  //           fontWeight: FontWeight.w500,
  //           letterSpacing: 0.5,
  //           color: Colors.black,
  //         );
static TextStyle mainContent = GoogleFonts.notoSerif(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black, );
}