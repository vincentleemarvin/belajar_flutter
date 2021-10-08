import 'package:flutter/material.dart';
// import 'package:belajar_flutter/nav-drawer.dart';

class Mockup extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Mockup> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xFFFAFAFC),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  color: Colors.amber,
                  width: MediaQuery.of(context).size.width,
                  height: 380,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: <Widget>[],
                  )),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text(
                  'V',
                  style: TextStyle(fontSize: 30),
                ),
                radius: (25),
              ),
              title: Text(
                'Vincent Lee Marvin',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                '@vincentleemarvin',
                style: TextStyle(fontSize: 12),
              ),
            ),
            height: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[Color(0xFF4548D0), Color(0xFFA76AEE)])),
          ),
          Positioned(
            right: 12.0,
            top: 180.0,
            height: 151.0,
            width: 336.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(0xFFFAFAFC),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: ('My Wallet'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: ('Insight'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: ('Tool'),
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
