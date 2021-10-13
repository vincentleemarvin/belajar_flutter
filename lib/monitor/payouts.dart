import 'package:belajar_flutter/monitor/prep.dart';
import 'package:flutter/material.dart';

class PayoutScreen extends StatefulWidget {
  @override
  _PayoutScreenState createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Stack(
        children: [
          PageName(),
        ],
      )),
    );
  }
}

class PageName extends StatelessWidget {
  const PageName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 6),
        height: 25,
        child: Text(
          'Payouts',
          style: TextStyle(
              color: fontWhite, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
