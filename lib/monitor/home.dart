import 'dart:convert';
import 'package:belajar_flutter/monitor/prep.dart';
import 'package:http/http.dart' as http;
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
        child: SingleChildScrollView(
          child: Stack(
            children: [
              PageName(),
              UnpaidBalance(),
              InfoModal(),
            ],
          ),
        ),
      ),
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
          'https://api-etc.ethermine.org/miner/be3352c914bda5422a832d40c610bd3ac4177778/dashboard')),
      http.get(Uri.parse(
          'https://api-etc.ethermine.org/miner/be3352c914bda5422a832d40c610bd3ac4177778/currentStats')),
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

class InfoModal extends StatefulWidget {
  @override
  _InfoModalState createState() => _InfoModalState();
}

class _InfoModalState extends State<InfoModal> {
  Map<String, dynamic> dashboard, currentStats, minerstat;
  num unpaid;

  Future getData() async {
    final response = await Future.wait([
      http.get(Uri.parse(
          'https://api-etc.ethermine.org/miner/be3352c914bda5422a832d40c610bd3ac4177778/dashboard')),
      http.get(Uri.parse(
          'https://api-etc.ethermine.org/miner/be3352c914bda5422a832d40c610bd3ac4177778/currentStats')),
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

    // print(dashboard['data']['currentStatistics']['currentHashrate']);
  }

  final cont2Color = Color(0xff2C2E43);
  final fontWhite = Color(0xffe3e3e3);
  final hovColor = Color(0xffcfced3);
  // ignore: non_constant_identifier_names
  final Biru = Color(0xff2962AB);
  double kDefaultModal = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 150),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kDefaultModal),
            topRight: Radius.circular(kDefaultModal)),
        color: cont2Color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (dashboard != null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BoxInAcHa(
                        kDefaultModal: kDefaultModal,
                        Biru: Biru,
                        number: dashboard['data']['currentStatistics']
                            ['activeWorkers'],
                        subtitle: 'Active Workers',
                      ),
                      BoxInAcHa(
                        kDefaultModal: kDefaultModal,
                        Biru: Biru,
                        number: minerstat['FELIXPC']['info']['inactive'],
                        subtitle: 'Inactive Workers',
                      ),
                      BoxInAcHa(
                        kDefaultModal: kDefaultModal,
                        Biru: Biru,
                        number: minerstat['FELIXPC']['hardware'].length,
                        subtitle: 'Total Hardware',
                      ),
                    ],
                  );
                } else {
                  return Container(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Hashrate',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 5),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (minerstat != null) {
                  var currentHr =
                      dashboard['data']['currentStatistics']['currentHashrate'];
                  var currentHr2 = currentHr.toDouble() * 1000000000;
                  var currentHr3 = currentHr2 / 1000000000000000;
                  var currentHashrate = currentHr3.toString();
                  // ignore: non_constant_identifier_names
                  var ReportedHr = dashboard['data']['currentStatistics']
                      ['reportedHashrate'];
                  var reportedHr = ReportedHr.toDouble() / 1000000;
                  var reportedHashrate = reportedHr.toString();
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultModal),
                      color: bgColor,
                    ),
                    child: Column(
                      children: [
                        Hashrate(
                          fontWhite: fontWhite,
                          tipe: 'Current',
                          hr: currentHashrate.substring(0, 4),
                        ),
                        Hashrate(
                          fontWhite: fontWhite,
                          tipe: 'Average',
                          hr: 'sulit',
                        ),
                        Hashrate(
                          fontWhite: fontWhite,
                          tipe: 'Reported',
                          hr: reportedHashrate.substring(0, 4),
                        ),
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
            SizedBox(height: 20),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (minerstat != null) {
                  var btcDay =
                      minerstat['FELIXPC']['revenue']['btc_day'].toString();
                  var btcWeek =
                      minerstat['FELIXPC']['revenue']['btc_week'].toString();
                  var btcMonth =
                      minerstat['FELIXPC']['revenue']['btc_month'].toString();
                  var usdDay =
                      minerstat['FELIXPC']['revenue']['usd_day'].toString();
                  var usdWeek =
                      minerstat['FELIXPC']['revenue']['usd_week'].toString();
                  var usdMonth =
                      minerstat['FELIXPC']['revenue']['usd_month'].toString();
                  var etcDay =
                      minerstat['FELIXPC']['revenue']['coin'].toString();
                  var etcweek1 =
                      minerstat['FELIXPC']['revenue']['coin'].toDouble() * 7;
                  var etcWeek = etcweek1.toString();
                  var etcmonth1 =
                      minerstat['FELIXPC']['revenue']['coin'].toDouble() * 30;
                  var etcMonth = etcmonth1.toString();
                  return Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'ETC (expected earning)',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 5),
                      ExpEarn(
                        mataUang: 'ETC ',
                        estimasid: etcDay.substring(0, 4),
                        estimasiw: etcWeek.substring(0, 4),
                        estimasim: etcMonth.substring(0, 4),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'BTC (expected earning)',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 5),
                      ExpEarn(
                        mataUang: 'BTC ',
                        estimasid: btcDay.substring(0, 5),
                        estimasiw: btcWeek.substring(0, 5),
                        estimasim: btcMonth.substring(0, 5),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'USD (expected earning)',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 5),
                      ExpEarn(
                        mataUang: 'USD ',
                        estimasid: usdDay.substring(0, 4),
                        estimasiw: usdWeek.substring(0, 4),
                        estimasim: usdMonth.substring(0, 4),
                      ),
                    ],
                  ));
                } else {
                  return Container(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Hashrate extends StatelessWidget {
  final String tipe, hr;
  const Hashrate({
    Key key,
    @required this.fontWhite,
    this.tipe,
    this.hr,
  }) : super(key: key);

  final Color fontWhite;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {0: FractionColumnWidth(.66)},
      children: [
        TableRow(children: [
          Container(
            child: Text(
              tipe,
              style: TextStyle(color: fontWhite, fontSize: 22),
            ),
          ),
          Text(
            hr.toString(),
            style: TextStyle(color: Biru, fontSize: 20),
          ),
          Text(
            ' MHs',
            style: TextStyle(color: fontWhite, fontSize: 20),
          ),
        ]),
      ],
    );
  }
}

class BoxInAcHa extends StatelessWidget {
  final String subtitle;
  final int number;

  const BoxInAcHa({
    Key key,
    @required this.kDefaultModal,
    // ignore: non_constant_identifier_names
    @required this.Biru,
    this.subtitle,
    this.number,
  }) : super(key: key);

  final double kDefaultModal;
  // ignore: non_constant_identifier_names
  final Color Biru;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 90,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(kDefaultModal)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(number.toString(),
              style: TextStyle(
                  fontSize: 30, color: Biru, fontWeight: FontWeight.bold)),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class ExpEarn extends StatelessWidget {
  final String mataUang, estimasid, estimasiw, estimasim;

  const ExpEarn(
      {Key key, this.mataUang, this.estimasid, this.estimasiw, this.estimasim})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            width: 130,
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(kDefaultModal)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(mataUang,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                    Text(estimasid.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Biru,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Text('daily',
                    style: TextStyle(color: Colors.grey, fontSize: 10))
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 130,
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(kDefaultModal)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(mataUang,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                    Text(estimasiw.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Biru,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Text('weekly',
                    style: TextStyle(color: Colors.grey, fontSize: 10))
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 130,
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(kDefaultModal)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(mataUang,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                    Text(estimasim.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Biru,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Text('monthly',
                    style: TextStyle(color: Colors.grey, fontSize: 10))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
