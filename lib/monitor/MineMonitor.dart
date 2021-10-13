import 'package:belajar_flutter/monitor/home.dart';
import 'package:belajar_flutter/monitor/payouts.dart';
import 'package:belajar_flutter/monitor/prep.dart';
import 'package:belajar_flutter/monitor/worker.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MineMon extends StatefulWidget {
  @override
  _MineMonState createState() => _MineMonState();
}

class _MineMonState extends State<MineMon> {
  int selectedIndex = 1;
  List screen = [
    WorkerScreen(),
    HomeScreen(),
    PayoutScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: screen[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
          color: contColor,
          backgroundColor: bgColor,
          buttonBackgroundColor: hovColor,
          height: 55,
          index: selectedIndex,
          animationCurve: Curves.easeOutCubic,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            Icon(
              Icons.computer_outlined,
              size: 30,
              color: Biru,
            ),
            Icon(
              Icons.home_outlined,
              size: 30,
              color: Biru,
            ),
            Icon(
              Icons.monetization_on_outlined,
              size: 30,
              color: Biru,
            ),
          ]),
    );
  }
}
