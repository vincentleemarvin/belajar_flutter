import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:belajar_flutter/monitor/prep.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Stack(
        children: [
          PageName(),
          UnpaidBalance(),
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
        margin: EdgeInsets.only(top: 5),
        height: 25,
        child: Text(
          'Dashboard',
          style: TextStyle(
              color: fontWhite, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}

class UnpaidBalance extends StatefulWidget {
  @override
  _UnpaidBalanceState createState() => _UnpaidBalanceState();
}

class _UnpaidBalanceState extends State<UnpaidBalance> {
  Map<String, dynamic> dashboard, currentStats, minerstat;
  num unpaid;

  Future getData() async {
    final response = await Future.wait([
      http.get(Uri.parse(
          'https://api-etc.ethermine.org/miner/0xbe3352c914bda5422a832d40c610bd3ac4177778/dashboard')),
      http.get(Uri.parse(
          'https://api-etc.ethermine.org/miner/0xbe3352c914bda5422a832d40c610bd3ac4177778/currentStats')),
      http.get(Uri.parse('https://api.minerstat.com/v2/stats/zuzp901vqrcr')),
    ]);

    if (this.mounted) {
      setState(() {
        dashboard = jsonDecode(response[0].body);
        unpaid =
            jsonDecode(response[0].body)['data']['currentStatistics']['unpaid'];
        currentStats = jsonDecode(response[1].body);
        minerstat = jsonDecode(response[2].body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 50),
      height: 80,
      child: Column(
        children: [
          FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (unpaid != null) {
                var batasUnpaid = unpaid.toDouble() / 1000000000000000000;
                var doublein = batasUnpaid.toString();
                return Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(minerstat['FELIXPC']['mining']['crypto'] + ' ',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                      Text(doublein.substring(0, 7),
                          style: TextStyle(
                              fontSize: 30,
                              color: Biru,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              } else {
                return Container(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Text(
            'Unpaid Balance',
            style: TextStyle(color: Colors.grey, fontSize: 10),
          )
        ],
      ),
    );
  }
}
