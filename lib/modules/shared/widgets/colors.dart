import 'package:flutter/material.dart';

class AppColors {
// Primary color shades - Base: #97F9F9
  static const Color primary100 = Color(0xFFD9FFFF); // +50% lighter
  static const Color primary200 = Color(0xFFCFFFFF); // +40% lighter
  static const Color primary300 = Color(0xFFC2FFFF); // +30% lighter
  static const Color primary400 = Color(0xFFB4FFFF); // +20% lighter
  static const Color primary500 = Color(0xFFA6FCFC); // +10% lighter
  static const Color primary600 = Color(0xFF97F9F9); // Base Color
  static const Color primary700 = Color(0xFF8DECEC); // 10% darker
  static const Color primary800 = Color(0xFF6FC7C7); // 20% darker
  static const Color primary900 = Color(0xFF3E8B8C); // 30% darker
  static const Color primary1000 = Color(0xFF004040); // 40% darker

// Secondary color shades - Base: #22223B
  static const Color secondary100 = Color(0xFF9191AA); // +50% lighter
  static const Color secondary200 = Color(0xFF777790); // +40% lighter
  static const Color secondary300 = Color(0xFF5D5D76); // +30% lighter
  static const Color secondary400 = Color(0xFF43435C); // +20% lighter
  static const Color secondary500 = Color(0xFF2F2F48); // +10% lighter
  static const Color secondary600 = Color(0xFF22223B); // Base Color
  static const Color secondary700 = Color(0xFF1F1F35); // 10% darker
  static const Color secondary800 = Color(0xFF1B1B2F); // 20% darker
  static const Color secondary900 = Color(0xFF171729); // 30% darker
  static const Color secondary1000 = Color(0xFF131323); // 40% darker
  static const Color secondary1100 = Color(0xFF0F0F1D); // 50% darker

  // Black shades (from dark to light)
  static const Color black100 = Color(0xFF000000); // Black - main
  static const Color black200 = Color(0xFF1A1A1A);
  static const Color black300 = Color(0xFF333333);
  static const Color black400 = Color(0xFF4D4D4D);
  static const Color black500 = Color(0xFF666666);
  static const Color black600 = Color(0xFF808080);
  static const Color black700 = Color(0xFF999999);
  static const Color black800 = Color(0xFFB3B3B3);
  static const Color black900 = Color(0xFFCCCCCC);

  // White shades (from light gray to white)
  static const Color white100 = Color(0xFFFFFFFF); // White - main
  static const Color white200 = Color(0xFFF2F2F2);
  static const Color white300 = Color(0xFFE6E6E6);
  static const Color white400 = Color(0xFFD9D9D9);
  static const Color white500 = Color(0xFFCCCCCC);
  static const Color white600 = Color(0xFFBFBFBF);
  static const Color white700 = Color(0xFFB3B3B3);
  static const Color white800 = Color(0xFFA6A6A6);
  static const Color white900 = Color(0xFF999999);

  // Error color gradient (from light to dark)
  static const Color error100 = Color(0xFFFFE2DB); // #ffe2db
  static const Color error200 = Color(0xFFFFCBC4); // #ffcbc4
  static const Color error300 = Color(0xFFFFB0A9); // #ffb0a9
  static const Color error400 = Color(0xFFFF968F); // #ff968f
  static const Color error500 = Color(0xFFFF7A76); // #ff7a76
  static const Color error600 = Color(0xFFFF5C5C); // #ff5c5c
  static const Color error700 = Color(0xFFF35555); // #f35555
  static const Color error800 = Color(0xFFD13F41); // #d13f41
  static const Color error900 = Color(0xFF991822); // #991822
  static const Color error1000 = Color(0xFF500000); // #500000

  // Success color gradient (from light to dark)
  static const Color success100 = Color(0xFFCCFFEE); // #ccffee
  static const Color success200 = Color(0xFFB2FFDC); // #b2ffdc
  static const Color success300 = Color(0xFF93F2C8); // #93f2c8
  static const Color success400 = Color(0xFF73E3B4); // #73e3b4
  static const Color success500 = Color(0xFF4DDD3A); // #4ddd3a
  static const Color success600 = Color(0xFF00C48C); // #00c48c
  static const Color success700 = Color(0xFF00BA84); // #00ba84
  static const Color success800 = Color(0xFF009D6C); // #009d6c
  static const Color success900 = Color(0xFF006E46); // #006e46
  static const Color success1000 = Color(0xFF003215); // #003215

  static const Color error = error600;
  static const Color success = success600;
  static const Color primary = primary600;
  static const Color secondary = secondary600;
  static const Color black = black100;
  static const Color white = white100;
  static const Color transparent = Colors.transparent;
}
