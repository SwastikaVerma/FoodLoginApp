import 'package:flutter/material.dart';
import 'package:foodlogin/foodlist.dart';
import 'package:foodlogin/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



//import 'package:animations/animations.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


class Food extends StatefulWidget {
  Food({Key? key}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('register');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.orange,
            centerTitle: true,
            title: Text(
              "FOOD ITEMS",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            
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
                              radius: 35,
                              backgroundColor: Colors.orange,
                              child: Icon(Icons.account_circle_rounded, color: Colors.black),
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
                                    style:
                                        TextStyle(fontSize: 22, color: Colors.orange),
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
                                style: TextStyle(fontSize: 18, color: Colors.orange),
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
                        title: const Text("Favourite order",
                        style: TextStyle(
                          fontSize: 20,
                           ),
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
                        title: const Text("Category",
                        style: TextStyle(
                          fontSize: 20,
                           ),
                           ),
                           
                        
                         onTap: () {
                           Navigator.push(context,
                           MaterialPageRoute(builder: (BuildContext context) => FoodList())
                           );
                         },
                      ),

                      ListTile(
                      leading: Icon(
                                Icons.settings_outlined,
                                color: Colors.black,
                                size: 24.0,
                              ),
                        title: const Text("Settings",
                        style: TextStyle(
                          fontSize: 20,
                           ),
                           ),
                           
                        
                        // onTap: () {
                        //   Navigator.pop(context);
                        // },
                      ),

                      ListTile(
                      leading: Icon(
                                Icons.logout_outlined,
                                color: Colors.black,
                                size: 24.0,
                              ),
                        title: const Text("Logout",
                        style: TextStyle(
                          fontSize: 20,
                           ),
                           ),
                           
                        
                         onTap: () async{
                          await _auth.signOut();
                          Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (BuildContext context) => FudLog()),
                          (route) => false);
                           /*Navigator.push(context, 
                           MaterialPageRoute<void>(
                            builder: (BuildContext context) => LoginPage(),
                             ),
                           );*/
                         },
                      ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Category",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 90,
                  child: StreamBuilder(
                    stream: firestore.collection("category").snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> ass){
                       var a = ass.data.docs;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index){
                           
                           // print(a);
                            if (index < 10) {
                                return Column(
                                  children: [
                                    Expanded(
                                        child:
                                            Container(
                                              height: 100,
                                              width: 100,
                                              margin: EdgeInsets.symmetric(horizontal: 10,),
                                              child: Image.network(a[index]['image'], fit: BoxFit.cover,),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Text(a[index]['name']),
                                  ],
                                );
                              } else {
                                return TextButton(
                                  onPressed: () {
                                    
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            FoodList(
                                                
                                                ),
                                      ),
                                    );
                                  },
                                  child: Text('See More'),
                                  style: TextButton.styleFrom(
                                    alignment: AlignmentDirectional.center,
                                  // backgroundColor: Colors.orange[900],
                                    primary: Colors.orange[900],
                                  ),
                                );
                              }
                            },
                            itemCount: (a.length>10)?11:a.length
                            );
                    }
                  ),

                ),

                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Popular Dishes",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GridView.count(
                      //scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(10),
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 2,
                      crossAxisCount: 2,
                      
                      children: <Widget>[
                        Container(

                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(9).jpg?alt=media&token=90cdec3e-47b4-4007-852a-799ac80634c2",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "VEG",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(10).jpg?alt=media&token=9ce9fb02-90c8-45d5-9380-4c95ee69948e",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "NON-VEG",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(4).jpg?alt=media&token=81a3ae44-6bcf-4357-9975-7f248daf64bd",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "CHINESE",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/italian-cuisine-47-1440x600.jpg?alt=media&token=ce37acd6-0df6-47ad-a8bb-7efda2377e61",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "ITALIAN",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(11).jpg?alt=media&token=f164ea08-89af-4069-a6c8-f87979f0a593",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "SALAD",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/stock-photo-indian-sweets-served-silver-wooden-plate-variety-peda-burfi-laddu-decorative-selective-focus-diwali-100924860.jpg?alt=media&token=8dbec30b-68dd-4607-8ea6-39834a7a84bb",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "SWEETS",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                        
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(12).jpg?alt=media&token=916a9512-3fd8-4310-9638-0de75f945a9f",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "CAKE",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(13).jpg?alt=media&token=3f4561da-a41e-4b92-bfe9-0cbe041e9cef",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "BEVERAGES",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                //
                // bottomNavigationBar: ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
