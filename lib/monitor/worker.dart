import 'package:belajar_flutter/monitor/prep.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class WorkerScreen extends StatefulWidget {
  @override
  _WorkerScreenState createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Stack(
        children: [
          PageName(),
          WorkerName(),
          InfoModal(),
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
          'Worker',
          style: TextStyle(
              color: fontWhite, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}

class WorkerName extends StatefulWidget {
  @override
  _WorkerNameState createState() => _WorkerNameState();
}

class _WorkerNameState extends State<WorkerName> {
  Map<String, dynamic> minerstat;

  Future getData() async {
    final response = await Future.wait([
      http.get(Uri.parse('https://api.minerstat.com/v2/stats/zuzp901vqrcr')),
    ]);

    if (this.mounted) {
      setState(() {
        minerstat = jsonDecode(response[0].body)['FELIXPC'];
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
              if (minerstat != null) {
                return Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(minerstat['info']['name'],
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                );
              } else {
                return Container(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Text(
            'Worker Name',
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
  Map<String, dynamic> minerstat;

  Future getData() async {
    final response = await Future.wait([
      http.get(Uri.parse('https://api.minerstat.com/v2/stats/zuzp901vqrcr')),
    ]);

    if (this.mounted) {
      setState(() {
        minerstat = jsonDecode(response[0].body)['FELIXPC'];
      });
    }
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
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 3),
              child: Text(
                'Mining',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (minerstat != null) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: bgColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(minerstat['mining']['crypto'],
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                        Text(
                            minerstat['mining']['client'] +
                                " - " +
                                minerstat['mining']['pool'],
                            style: TextStyle(color: Colors.grey, fontSize: 10)),
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 3),
              child: Text(
                'Hardware',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (minerstat != null) {
                  var hardware1 = minerstat['hardware'][0];
                  var hardware2 = minerstat['hardware'][1];
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultModal),
                      color: bgColor,
                    ),
                    child: Table(
                      columnWidths: {0: FractionColumnWidth(.66)},
                      children: [
                        TableRow(children: [
                          Container(
                            height: 35,
                            child: Text(
                              'Hardware',
                              style: TextStyle(
                                  color: fontWhite,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'Temp',
                            style: TextStyle(
                                color: fontWhite,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' Fans',
                            style: TextStyle(
                                color: fontWhite,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            hardware1['name'],
                            style: TextStyle(color: fontWhite, fontSize: 15),
                          ),
                          Text(
                            hardware1['temp'].toString() + "°C",
                            style: TextStyle(color: fontWhite, fontSize: 15),
                          ),
                          Text(
                            hardware1['fan'].toString() + "%",
                            style: TextStyle(color: fontWhite, fontSize: 15),
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            hardware2['name'],
                            style: TextStyle(color: fontWhite, fontSize: 15),
                          ),
                          Text(
                            hardware2['temp'].toString() + "°C",
                            style: TextStyle(color: fontWhite, fontSize: 15),
                          ),
                          Text(
                            hardware2['fan'].toString() + "%",
                            style: TextStyle(color: fontWhite, fontSize: 15),
                          ),
                        ]),
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 3),
              child: Text(
                'Status',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (minerstat != null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Container(
                            width: 150,
                            height: 70,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Online',
                                    style: TextStyle(
                                        color: bgColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ],
                            )),
                      ),
                      Container(
                        width: 150,
                        height: 70,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(minerstat['info']['uptime'].toString(),
                                style: TextStyle(
                                    fontSize: 25,
                                    color: fontWhite,
                                    fontWeight: FontWeight.bold)),
                            Text('uptime',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10))
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
