import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_lusso2/constants/constants.dart';
import 'screen/screen_one.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
      children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background1.png'),
                ),
              ],
            ),
            Positioned(
              top: size.height * 0.15,
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(appPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Image(
                  width: size.width,
                  height: size.height * 0.12,
                  // fit: BoxFit.cover,
                  image: AssetImage('assets/images/logo.png'),
                   ),
                   SizedBox(
                      height: size.height * 0.04,
                    ),
                    Text(
                      'Book Car that suits',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 15,
                      ),
                    ),
                   Text(
                      'you the most',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
                ],
              ),
            ),       
    ); 
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 4), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardingScreenOne()));
  }
}
