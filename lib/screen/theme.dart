import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline5: base.headline5.copyWith(
          // fontFamily: 'Roboto',
          fontSize: 15.0,
          //color: Colors.purpleAccent,
          color: Colors.white,
          //fontWeight: FontWeight.bold,
          height: 1.5
        ),
        headline6: base.headline6.copyWith(
          // fontFamily: 'Merriweather',
          fontSize: 15.0,
          color: Colors.green
        ),
        headline4: base.headline5.copyWith(
          // fontFamily: 'Roboto',
          //fontSize: 24.0,
          color: Colors.pinkAccent,
        ),
        headline3: base.headline5.copyWith(
          // fontFamily: 'Merriweather',
          fontSize: 22.0,
          color: Colors.grey,
        ),
        caption: base.caption.copyWith(
          color: Color(0xFFCCC5AF),
        ),
        
        bodyText2: base.bodyText2.copyWith(color: Color(0xFF807A6B)));
  }
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      //textTheme: Typography().white,
      primaryColor: Color(0xffce107c),
      //primaryColor: Color(0xff4829b2),
      indicatorColor: Color(0xFF807A6B),
      scaffoldBackgroundColor: Color(0xffce107c),
      accentColor: Color(0xFFFFF8E1),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 20.0,
      ),
      buttonColor: Colors.white,
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xffce107c),
        unselectedLabelColor: Colors.grey,
      ));
}