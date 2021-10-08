import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushNamed(context, '/homo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade700,
      body: SafeArea(
          child: Container(
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              foregroundColor: Colors.lightBlue.shade700,
              child: Icon(
                Icons.car_rental,
                size: 80,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'mo88i',
                  style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(-pi / 2, 7),
                  child: Text(
                    "powered by mobil88",
                    style: TextStyle(
                      fontFamily: 'SF Pro Display Regular',
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // RichText(
            //   textAlign: TextAlign.end,
            //   text: TextSpan(
            //     text: 'mo88i ',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 55,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     children: const <TextSpan>[
            //       TextSpan(
            //           text: '\npowered by ', style: TextStyle(fontSize: 15)),
            //       TextSpan(
            //           text: 'mobil88',
            //           style:
            //               TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            //     ],
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
