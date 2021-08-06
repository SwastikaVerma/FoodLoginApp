import 'package:flutter/material.dart';

class RestList extends StatefulWidget {
  RestList({Key? key}) : super(key: key);

  @override
  _RestListState createState() => _RestListState();
}

class RstList {
  String? rname;
  String? rimg;

  RstList(String rname, String rimg) {
    this.rname = rname;
    this.rimg = rimg;
  }
}

List<RstList> products = <RstList>[
  RstList("Courtyard MArriott",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/bar.jpg?alt=media&token=b822e040-994e-4ed7-bdb1-6173eed29945"),
  RstList("Cafe Yuva",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/yuva.jfif?alt=media&token=6fd9db05-931d-441d-b197-0b1c92de5086"),
  RstList("Cafe Knowhere",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/download%20(1).jfif?alt=media&token=69946679-7219-4755-b947-b8c10deb07a3"),
  RstList("Caffeeba",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(1).jfif?alt=media&token=4f7596e6-18bd-4cec-9e55-9a5733a3399b"),
  RstList("Cafe lbiza",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/download.jfif?alt=media&token=8fe88a82-2690-4d30-a59b-faa58922c596"),
  RstList("Hangover Cafe",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/mcdonaldsglobal.jpg?alt=media&token=806f545b-9f0f-445a-b788-ded6dd6f0d4b"),
  RstList("Destination Cafe",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/download%20(4).jpg?alt=media&token=ffaa5ed6-500f-4dea-acab-fd518dd40024"),
  RstList("Brewberry Cafe",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images.jfif?alt=media&token=1a9882f6-088a-483e-9c3e-b2d3a465e536"),
  RstList("ITALIAN",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/italian-cuisine-47-1440x600.jpg?alt=media&token=ce37acd6-0df6-47ad-a8bb-7efda2377e61"),
  RstList("Soup",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/3.-Bean-Sprout-Soup-Recipe.jpg?alt=media&token=8bfb79a8-b1c2-421b-96c5-aebc4852ec00"),
  RstList("PIZZA",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(3).jpg?alt=media&token=4044a9ff-7c63-4513-9541-0f30cedaeb21"),
  RstList("BURGER",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/delicious-grilled-burgers-260nw-1146199442.webp?alt=media&token=ca0cd09e-d676-4be4-9575-6033c66ec00d"),
  RstList("Madrasi",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/download.png?alt=media&token=1024048e-bb0d-49f2-b6df-1a622f209fee"),
  RstList("PASTA",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(5).jpg?alt=media&token=b50397c8-483c-404b-886f-7ed29d6d3e6d"),
  RstList("CHICKEN CHILLY",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/download.jpg?alt=media&token=6112b9ba-be0a-4d6d-9dbf-46f4ab0ea440"),
  RstList("PANEER CHILLY",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/chilli-paneer-dry-recipe-10.-500x500.jpg?alt=media&token=25e280b9-9d24-4f0d-845c-21ed9d6c978e"),
  RstList("GUPCHUP",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(6).jpg?alt=media&token=13b7c748-bc9c-441c-a378-8cb23afb83c2"),
  RstList("CHAT",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/Samosa-Chaat-2-3.jpg?alt=media&token=3415e9b6-bad5-4f7a-95d9-88a3cf556269"),
  RstList("MIX VEG",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(7).jpg?alt=media&token=92dfa115-af37-4c70-8af1-37a5373dc83b"),
  RstList("MUTTON",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(8).jpg?alt=media&token=210e01cf-ab73-4c78-9416-46fe5a919c37"),
];

class _RestListState extends State<RestList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
        body: Center(
          child: GridView.count(
            crossAxisSpacing: 1,
            mainAxisSpacing: 2,
            crossAxisCount: 2,
            children: products.map((e) {
              return Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(8),
                        child: Image.network(
                          e.rimg!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      e.rname!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
