import 'package:flutter/material.dart';
import 'SplashScreen.dart';
import 'screen/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      home: SplashScreen(),
    );
  }
}

