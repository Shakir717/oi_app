import 'package:flutter/material.dart';
import 'package:oi_app/core/const_data.dart';

class AppTheme {

  static bool isLightTheme = true;
  static Color primaryColor = darkColor;
  static Color primaryColorLight = lightColor;
  static Color primaryColorDark =darkColor;

  static Color primaryTextColor = lightColor;
  static Color secondaryTextColor = darkColor;

  // Not finalized
  static Color secondaryColor = lightColor;
  static Color secondaryColorLight = lightColor;

  static Color borderColor = lightColor;

  static TextTheme _buildTextTheme(TextTheme base) {
    var fontName = ""; // define in asssets

    return base.copyWith(
      headline6: base.headline6
          ?.copyWith(color: primaryTextColor, fontFamily: fontName),
      headline5: base.headline5
          ?.copyWith(color: primaryTextColor, fontFamily: fontName),
      headline4: base.headline4
          ?.copyWith(color: primaryTextColor, fontFamily: fontName),
      headline3: base.headline3
          ?.copyWith(color: primaryTextColor, fontFamily: fontName),
      headline2: base.headline2
          ?.copyWith(color: primaryTextColor, fontFamily: fontName),
      headline1: base.headline1
          ?.copyWith(color: primaryTextColor, fontFamily: fontName),
      bodyText2: base.bodyText2
          ?.copyWith(color: primaryTextColor, fontFamily: fontName),
      bodyText1: base.bodyText1
          ?.copyWith(color: primaryTextColor, fontFamily: fontName),
      subtitle2: base.subtitle2
          ?.copyWith(color: primaryTextColor, fontFamily: fontName),
      subtitle1: base.subtitle1
          ?.copyWith(color: primaryTextColor, fontFamily: fontName),
      button:
          base.button?.copyWith(color: primaryTextColor, fontFamily: fontName),
      caption:
          base.caption?.copyWith(color: primaryTextColor, fontFamily: fontName),
      overline:
          base.overline?.copyWith(color: primaryTextColor, fontFamily: fontName),
    );
  }

  static ThemeData getTheme() {
    if (isLightTheme) {
      return newLightTheme();
    } else {
      return newDarkTheme();
    }
  }

  static ThemeData newLightTheme() {
    // Color color1 = primaryColor;
    // Color color2 = secondaryColor;
    // final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    //   primary: color1,
    //   secondary: color2,
    // );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      // colorScheme: colorScheme,

      primaryColor: primaryColor,
      primaryColorLight: primaryColorLight,
      primaryColorDark: primaryColorDark,
      accentColor: primaryColorLight,

      cursorColor: secondaryTextColor,
      buttonColor: primaryColorDark,
      indicatorColor: lightColor,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,

      canvasColor: darkColor,
      backgroundColor: darkColor,
      //iconTheme: IconThemeData(color: primaryColorDark),

      scaffoldBackgroundColor:darkColor,
      errorColor: Colors.red,
      sliderTheme: SliderThemeData(
          activeTrackColor: AppTheme.secondaryColor,
          inactiveTrackColor: AppTheme.secondaryColor.withOpacity(0.2),
          thumbColor: AppTheme.secondaryColor),

      buttonTheme: ButtonThemeData(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.accent,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }

  static ThemeData newDarkTheme() {
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      primaryColorLight: primaryColorLight,
      primaryColorDark: primaryColorDark,
      buttonColor: secondaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      accentColor: secondaryColor,
      canvasColor: Colors.white,
      backgroundColor: Colors.black,
      scaffoldBackgroundColor:darkColor,
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.accent,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
