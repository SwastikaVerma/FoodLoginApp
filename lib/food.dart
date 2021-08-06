import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodlogin/foodlist.dart';
import 'package:foodlogin/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodlogin/restlist.dart';
import 'package:foodlogin/search.dart';

//import 'package:animations/animations.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Food1 extends StatelessWidget {
  const Food1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Food(),
    );
  }
}

class Food extends StatefulWidget {
  Food({Key? key}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('register');
  String? dname;
  String? dimg;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Indie Flower"),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.orange[300],
            centerTitle: true,
            title: Text(
              "miam!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 26.0,
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      currentAccountPicture: Padding(
                        padding: const EdgeInsets.only(right: 19.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.account_circle_rounded,
                              color: Colors.black),
                        ),
                      ),
                      accountName: Align(
                        alignment: Alignment.bottomLeft,
                        child: FutureBuilder(
                          future: users.doc(_auth.currentUser!.email).get(),
                          builder: (BuildContext context, AsyncSnapshot as) {
                            if (as.hasData) {
                              return Text(
                                as.data['name'],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            } else {
                              return Text(
                                "No user found!",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.orange),
                              );
                            }
                          },
                        ),
                      ),
                      accountEmail: Padding(
                        padding: EdgeInsets.only(bottom: 9, right: 19),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            _auth.currentUser!.email!,
                            style:
                                TextStyle(fontSize: 18, color: Colors.orange),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      title: const Text(
                        "Favourite order",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      // onTap: () {
                      //   Navigator.pop(context);
                      // },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.category_outlined,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      title: const Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => FoodList()));
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings_outlined,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      title: const Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      title: const Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onTap: () async {
                        await _auth.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => FudLog()),
                            (route) => false);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            //type: BottomNavigationBarType.fixed,
            //backgroundColor: Colors.transparent,

            currentIndex: index,
            onTap: (val) {
              setState(() {
                index = val;
              });
              print(index);
              switch (index) {
                case 0:
                  print("home");
                  break;
                case 1:
                  print("search");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Search()));
                  break;
                case 2:
                  print("history");
                  break;
                case 3:
                  print("explore");
                  break;
              }
            },
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.orange[100],

            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                title: Text(
                  'History',
                  style: TextStyle(color: Colors.grey),
                ),
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                title: Text(
                  'Explore',
                  style: TextStyle(color: Colors.grey),
                ),
                backgroundColor: Colors.black,
              ),
            ],
          ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [const Color(0xFFF7D978), const Color(0xFFFAFAFA)],
                ),
              ),
              child: SingleChildScrollView(
                //scrollDirection: Axis.horizontal,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Popular Dishes",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        child: StreamBuilder(
                            stream:
                                firestore.collection("category").snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> ass) {
                              var a = ass.data.docs;
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, index) {
                                    // print(a);
                                    if (index < 10) {
                                      return Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Image.network(
                                                a[index]['image'],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            a[index]['name'],
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  FoodList(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'See More',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        style: TextButton.styleFrom(
                                          alignment:
                                              AlignmentDirectional.center,
                                          // backgroundColor: Colors.orange[900],
                                          primary: Colors.black,
                                        ),
                                      );
                                    }
                                  },
                                  itemCount: (a.length > 10) ? 11 : a.length);
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Category",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: StreamBuilder(
                                  stream: firestore
                                      .collection("populardish")
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot ass) {
                                    var a = ass.data.docs;
                                    return GridView.count(
                                        shrinkWrap: true,
                                        primary: false,
                                        padding: const EdgeInsets.all(10),
                                        crossAxisSpacing: 1,
                                        mainAxisSpacing: 2,
                                        crossAxisCount: 2,
                                        children: a.map<Widget>((e) {
                                          return Container(
                                            child: Stack(
                                              alignment: AlignmentDirectional
                                                  .topCenter,
                                              // stackFit: BoxFit.contain,
                                              children: [
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 64),
                                                  height: 230,
                                                  width: 160,
                                                  child: Card(
                                                    color: Colors.yellow[50],
                                                    shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Colors
                                                                .white70,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        50),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            50))
                                                        // shape: RoundedRectangleBorder(
                                                        // borderRadius: const BorderRadius.all(
                                                        //   Radius.circular(8.0),
                                                        ),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      child: CircleAvatar(
                                                        radius: 64,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                e['dimg']),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      e['dname'],
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList());
                                  }),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Popular Resturants",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 150,
                              child: StreamBuilder(
                                  stream: firestore
                                      .collection("resturant")
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<dynamic> ass) {
                                    var a = ass.data.docs;
                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          // print(a);
                                          if (index < 10) {
                                            return Column(
                                              children: [
                                                Expanded(
                                                  child: Card(
                                                    color: Colors.orange[50],
                                                    child:
                                                        SingleChildScrollView(
                                                      padding: EdgeInsets.only(
                                                          top: 7),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 90,
                                                            width: 70,
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 10,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              a[index]['rimg'],
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                              a[index]['rname'],
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      17)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        RestList(),
                                                  ),
                                                );
                                              },
                                              child: Text('See More'),
                                              style: TextButton.styleFrom(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                // backgroundColor: Colors.orange[900],
                                                primary: Colors.orange[900],
                                              ),
                                            );
                                          }
                                        },
                                        itemCount:
                                            (a.length > 10) ? 11 : a.length);
                                  }),
                            ),
                          ]),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
