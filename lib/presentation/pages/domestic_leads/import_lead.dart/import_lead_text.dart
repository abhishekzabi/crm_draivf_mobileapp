import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:flutter/material.dart';

class ImportLeadTexts {
  static const baseStyle = TextStyle(
    fontSize: 12,
    fontFamily: AppFonts.poppins,
    color: Colors.blue,
  );

  static const redStyle = TextStyle(
    fontSize: 12,
    fontFamily: AppFonts.poppins,
    color: Colors.red,
  );

  static const boldStyle = TextStyle(
    fontSize: 12,
    fontFamily: AppFonts.poppins,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );

  // Point 1
  static final point1Part1 = TextSpan(text: "1. Your CSV data should be in the format below. The first line of your CSV file should be the column headers as in the table example. Also make sure that your file is ", style: baseStyle);
  static final utf8Part = TextSpan(text: "UTF-8", style: boldStyle);
  static final point1Part2 = TextSpan(text: " to avoid unnecessary encoding problems.", style: baseStyle);

  // Point 2
  static final point2Part1 = TextSpan(text: "2. If the column you are trying to import is date make sure that is formatted in format ", style: baseStyle);
  static final dateFormat = TextSpan(text: "Y-m-d (2025-08-24)", style: boldStyle);
  static final point2Part2 = TextSpan(text: ".", style: baseStyle);

  // Point 3
  static final point3Part1 = TextSpan(text: "3. Based on your leads ", style: baseStyle);
  static final uniqueValidation = TextSpan(text: "unique validation", style: redStyle);
  static final point3Part2 = TextSpan(text: " configured options, the lead won't be imported if:", style: baseStyle);

  // Leads
  static final leadEmail = TextSpan(text: "- Lead email already exists OR", style: baseStyle);
  static final leadPhone = TextSpan(text: "- Lead phonenumber already exists", style: baseStyle);

  // Note
  static final note = TextSpan(text: "If you still want to import all leads, uncheck all unique validation field", style: baseStyle);
}
