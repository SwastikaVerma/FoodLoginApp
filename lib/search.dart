import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:foodlogin/food.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Indie Flower"),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          onTap: (index) {
            print(index);
            switch (index) {
              case 0:
                print("home");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Food()));
                break;
              case 1:
                print("search");

                break;
              case 2:
                print("history");
                break;
              case 3:
                print("explore");
                break;
            }
          },
          selectedItemColor: Colors.orange[100],
          unselectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
              backgroundColor: Colors.black,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: 920,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [const Color(0xFFF7D978), const Color(0xFFFAFAFA)],
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: StreamBuilder(
                                stream: firestore
                                    .collection("populardish")
                                    .snapshots(),
                                builder:
                                    (BuildContext context, AsyncSnapshot ass) {
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
                                            alignment:
                                                AlignmentDirectional.topCenter,
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
                                                          color: Colors.white70,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(50),
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
                        ]),
                  ),
                  buildFloatingSearchBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    return FloatingSearchBar(
        backgroundColor: Colors.orange[50],
        hint: 'Search....',
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: const Icon(Icons.fastfood_outlined),
              onPressed: () {},
            ),
          ),
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return Material(
            shadowColor: Colors.black,
            color: Colors.orange[100],
          );
        });
    // TextButton(
    //   onPressed: () {},
    //   child: Text(
    //     "Category",
    //     style: TextStyle(
    //       color: Colors.black,
    //       fontSize: 30,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    // ),
    // Container(
    //   child: StreamBuilder(
    //       stream: firestore.collection("populardish").snapshots(),
    //       builder: (BuildContext context, AsyncSnapshot ass) {
    //         var a = ass.data.docs;
    //         print(ass);
    //         return GridView.count(
    //             shrinkWrap: true,
    //             primary: false,
    //             padding: const EdgeInsets.all(10),
    //             crossAxisSpacing: 1,
    //             mainAxisSpacing: 2,
    //             crossAxisCount: 2,
    //             children: a.map<Widget>((e) {
    //               return Container(
    //                 child: Stack(alignment: AlignmentDirectional.topCenter,
    //                     // stackFit: BoxFit.contain,
    //                     children: [
    //                       Container(
    //                         padding: EdgeInsets.only(top: 64),
    //                         height: 230,
    //                         width: 160,
    //                         child: Card(
    //                           color: Colors.yellow[50],
    //                           shape: RoundedRectangleBorder(
    //                               side: BorderSide(
    //                                   color: Colors.white70, width: 1),
    //                               borderRadius: BorderRadius.only(
    //                                   topLeft: Radius.circular(50),
    //                                   bottomRight: Radius.circular(50))
    //                               // shape: RoundedRectangleBorder(
    //                               // borderRadius: const BorderRadius.all(
    //                               //   Radius.circular(8.0),
    //                               ),
    //                         ),
    //                       ),
    //                       Column(
    //                         children: [
    //                           Container(
    //                             child: CircleAvatar(
    //                               radius: 64,
    //                               backgroundImage: NetworkImage(e['dimg']),
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: 10,
    //                           ),
    //                           Text(
    //                             e['dname'],
    //                             textAlign: TextAlign.end,
    //                             style: TextStyle(
    //                               fontWeight: FontWeight.bold,
    //                               fontSize: 24,
    //                               color: Colors.black,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ]),
    //               );
    //             }).toList());
    //       }),
  }
}
