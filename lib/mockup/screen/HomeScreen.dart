import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';

//coba mau masukin ke github

class HomeScreenMo extends StatefulWidget {
  @override
  _HomeScreenMoState createState() => _HomeScreenMoState();
}

class _HomeScreenMoState extends State<HomeScreenMo> {
  // ignore: non_constant_identifier_names
  var _DDHarga = "Pilih";
  // ignore: non_constant_identifier_names
  var _DDTahun = "Pilih";
  // ignore: non_constant_identifier_names
  var _DDTransmisi = "Pilih";

  List<String> valueDDHarga = [
    "Pilih",
    "1-100 Juta",
    "100-200 Juta",
    "200-400 Juta",
    "400 Juta - 2 Milyar",
  ];

  List<String> valueDDTahun = [
    "Pilih",
    ">= 2018",
    "2016-2017",
    "2012-2015",
    "<= 2012",
  ];

  List<String> valueDDTransmisi = [
    "Pilih",
    "AT",
    "MT",
  ];

  List<String> kategoriRekomen = [
    "Terbaru",
    "Hot Deals",
    "Promosi",
  ];
  int selectedIndex = 0;

  final String url = 'http://192.168.1.15:8000/api/mobil';
  Future<List> getDataMobil() async {
    final response = await http.get(Uri.parse(url));
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //HomeScreen
            SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/mllogo.jpg'),
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      'Cari Mobil Bekas Impianmu',
                      style: TextStyle(
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "Masukan Merek, Model atau Tipe Mobil",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //DropDown Harga
                        Stack(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(left: 10)),
                                      Icon(
                                        Icons.money_outlined,
                                        color: Colors.blue.shade800,
                                        size: 30,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(right: 10)),
                                      Text(
                                        'Harga',
                                        style: TextStyle(
                                            color: Colors.blue.shade800,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 2,
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          iconSize: 20,
                                          isExpanded: true,
                                          value: _DDHarga,
                                          onChanged: (newVal) {
                                            setState(() {
                                              _DDHarga = newVal;
                                            });
                                          },
                                          items: valueDDHarga
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem(
                                                child: Text(
                                                  value,
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                value: value);
                                          }).toList()),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //DropDown Tahun
                        Stack(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(left: 10)),
                                      Icon(
                                        Icons.calendar_today,
                                        color: Colors.blue.shade800,
                                        size: 30,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(right: 10)),
                                      Text(
                                        'Tahun',
                                        style: TextStyle(
                                            color: Colors.blue.shade800,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 2,
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          iconSize: 20,
                                          isExpanded: true,
                                          value: _DDTahun,
                                          onChanged: (newVal) {
                                            setState(() {
                                              _DDTahun = newVal;
                                            });
                                          },
                                          items: valueDDTahun
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem(
                                                child: Text(
                                                  value,
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                value: value);
                                          }).toList()),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //DropDown Transmisi
                        Stack(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(left: 10)),
                                      Icon(
                                        Icons.local_gas_station_outlined,
                                        color: Colors.blue.shade800,
                                        size: 30,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(right: 10)),
                                      Text(
                                        'Transmisi',
                                        style: TextStyle(
                                            color: Colors.blue.shade800,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 2,
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          iconSize: 20,
                                          isExpanded: true,
                                          value: _DDTransmisi,
                                          onChanged: (newVal) {
                                            setState(() {
                                              _DDTransmisi = newVal;
                                            });
                                          },
                                          items: valueDDTransmisi
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem(
                                                child: Text(
                                                  value,
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                value: value);
                                          }).toList()),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                                onPressed: () {},
                                child: Text(
                                  'Cari',
                                  style: TextStyle(fontSize: 20),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rekomendasi Mobil',
                          style: TextStyle(
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          'Lainnya',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      height: 25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: kategoriRekomen.length,
                          itemBuilder: (context, index) =>
                              buildKategoriRekomen(index)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder<List>(
                    future: getDataMobil(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? RekomenMobil(
                              rMobil: snapshot.data,
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
            //Custom Appbar
            CustomAppBar(),
            //FAB Live Chat
            FABLiveChat()
          ],
        ),
      ),
    );
  }

//kategori dari rekomendasi mobil
  Widget buildKategoriRekomen(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 2, color: Colors.grey))),
        padding: const EdgeInsets.only(left: 20, right: 31),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kategoriRekomen[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    selectedIndex == index ? Colors.blue.shade800 : Colors.grey,
              ),
            ),
            Container(
              height: 2,
              width: 30,
              color: selectedIndex == index
                  ? Colors.blue.shade800
                  : Colors.transparent,
              margin: EdgeInsets.only(top: 20 / 4),
            )
          ],
        ),
      ),
    );
  }
}

class RekomenMobil extends StatefulWidget {
  final List rMobil;
  RekomenMobil({this.rMobil});

  @override
  _RekomenMobilState createState() => _RekomenMobilState();
}

class _RekomenMobilState extends State<RekomenMobil> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 330,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const PageScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.rMobil == null ? 0 : widget.rMobil.length,
          itemBuilder: (context, i) {
            return Card(
              child: Column(
                children: [
                  SizedBox(
                    width: 10,
                    height: 100,
                    child: Icon(Icons.image_not_supported),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Flexible(
                          child: Text(
                            widget.rMobil[i]['merk'] +
                                " " +
                                widget.rMobil[i]['model'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30)),
                  SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          widget.rMobil[i]['produksi'],
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 11),
                        ),
                        Padding(padding: EdgeInsets.only(right: 3)),
                        Text(
                          '|',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 11),
                        ),
                        Padding(padding: EdgeInsets.only(right: 3)),
                        Text(
                          widget.rMobil[i]['kilometer'] + 'km',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 11),
                        ),
                        Padding(padding: EdgeInsets.only(right: 3)),
                        Text(
                          '|',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 11),
                        ),
                        Padding(padding: EdgeInsets.only(right: 3)),
                        Text(
                          widget.rMobil[i]['transmisi'],
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(widget.rMobil[i]['harga']),
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blue.shade800,
                        ),
                        Text(
                          'Kota ' + widget.rMobil[i]['lokasi_kota'],
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Container(
                    width: 150,
                    height: 30,
                    color: Colors.grey.shade300,
                    child: Center(
                      child: Text('Bandingkan'),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class FABLiveChat extends StatelessWidget {
  const FABLiveChat({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        alignment: FractionalOffset.bottomRight,
        child: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: null,
          label: Text('Live Chat'),
        ));
  }
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue.shade800,
                  child: Icon(Icons.car_rental)),
              SizedBox(
                width: 5,
              ),
              Text(
                'mo88i',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.search,
                size: 35,
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.menu,
                size: 35,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
