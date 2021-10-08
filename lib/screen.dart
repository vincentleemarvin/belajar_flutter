import 'package:flutter/material.dart';
import 'package:belajar_flutter/nav-drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      endDrawer: DrawerWidget(),
      body: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/R.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              //baris 1
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/product');
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 3),
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                        Text(
                          'Products',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/mockup');
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 3),
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.add_to_photos_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                        Text(
                          'Mock-Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/about');
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 3),
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.add_to_home_screen_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        Text(
                          'SliverApp',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // baris ke 2
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/baru');
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 3),
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.download_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                        Text(
                          'GET app',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/form');
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 3),
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.dynamic_form_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                        Text(
                          'Form',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/halaman-404');
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 3),
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.notification_important_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        Text(
                          '404',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //baris 3
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/mo88i');
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 3),
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent.shade100,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.car_rental,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                        Text(
                          'mo88i',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pushNamed(context, '/halaman-404');
      //         },
      //         child: Text('Tap Halaman lain'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("SliverAppBar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
                background: Image(
                  image: AssetImage('assets/images/unnamed.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: Text("SliverAppBar Boss"),
        ),
      ),
    );
  }
}
