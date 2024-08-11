import 'package:flutter/material.dart';
import 'package:flutter_lusso2/constants/constants.dart';
import 'package:flutter_lusso2/hometest.dart';

class OnboardingScreenThree extends StatelessWidget {
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
                  image: AssetImage('assets/images/screen3.png'),
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
                  height: size.height * 0.02,
                  // fit: BoxFit.cover,
                  image: AssetImage('assets/images/logo.png'),
                   ),
                   SizedBox(
                      height: size.height * 0.04,
                    ),
                    Text(
                      '3 of 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      'Book your Car',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Now',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.09,
                    ),
                    Text(
                      'Chat with us to secure',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        color: white,
                      ),
                    ),
                    Text(
                      'your car',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8 , vertical: 67),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: white),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8 , vertical: 67),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: white),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8 , vertical: 67),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: Colors.orange),
                  ),
                ],
              ),
            ),
            Padding(
              // padding: EdgeInsets.symmetric(vertical: appPadding * 2),
              padding: EdgeInsets.only(right: 80, top:560),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomePagea(),
                          ),
                        );
                      },
                      backgroundColor: Colors.deepOrange,
                      label: Text(
                        "Let's GET STARTED",
                        style: TextStyle(
                          color: white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 40, bottom:35),
                    child: FlatButton(
                      onPressed: () => print('NEED HELP'),
                      child: Text(
                        'NEED HELP?',
                        style: TextStyle(
                          color: white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
