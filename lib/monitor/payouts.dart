import 'package:belajar_flutter/monitor/prep.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
          PayThreshold(),
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
        margin: EdgeInsets.only(top: 6),
        height: 25,
        child: Text(
          'Payouts',
          style: TextStyle(
              color: fontWhite, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}

class PayThreshold extends StatefulWidget {
  @override
  _PayThresholdState createState() => _PayThresholdState();
}

class _PayThresholdState extends State<PayThreshold> {
  int setting;

  Future getData() async {
    final response = await Future.wait([
      http.get(Uri.parse(
          'https://api-etc.ethermine.org/miner/0xbe3352c914bda5422a832d40c610bd3ac4177778/settings')),
    ]);

    if (this.mounted) {
      setState(() {
        setting = jsonDecode(response[0].body)['data']['minPayout'];
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
              if (setting != null) {
                var sett = setting.toString();
                return Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text('0.' + sett.substring(0, 2),
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
            'Payment Threshold',
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
  Map<String, dynamic> payout;

  Future getData() async {
    final response = await Future.wait([
      http.get(Uri.parse(
          'https://api-etc.ethermine.org/miner/0xbe3352c914bda5422a832d40c610bd3ac4177778/payouts')),
    ]);

    if (this.mounted) {
      setState(() {
        payout = jsonDecode(response[0].body);
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
                'Payouts',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (payout != null) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: payout['data'].length,
                    shrinkWrap: true,
                    itemBuilder: (content, index) {
                      var id = payout['data'][index]['txHash'].toString();
                      var am = payout['data'][index]['amount'].toDouble();
                      var amou = am / 100000000000000000;
                      var amount = amou.toString();
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: bgColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(id.substring(0, 30) + "...",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Amount : ',
                                    style: TextStyle(color: fontWhite),
                                  ),
                                  Text(
                                    amount.substring(0, 10),
                                    style: TextStyle(color: fontWhite),
                                  ),
                                  Text(
                                    ' ETC',
                                    style: TextStyle(color: Colors.green),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
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
