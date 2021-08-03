import 'package:flutter/material.dart';

class FoodList extends StatefulWidget {
  FoodList({Key? key}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class ItemList{
  String? name;
  String? img;

  ItemList(String name, String img){
    this.name = name;
    this.img = img;
  }

}

List<ItemList> products = <ItemList>[
  ItemList("Dosa",
      "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/Recipes-Selected-Indian-Dosa.jpg?alt=media&token=8a834604-6b71-4365-b475-c5b3c633e6f1"
  ),

  ItemList("PANEER BUTTER MASALA","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/download%20(2).jpg?alt=media&token=33605092-e796-4815-8950-fab6b44fae3e"),

  ItemList("MANCHURIAN","https://i.ytimg.com/vi/xkMbJCtaaqA/maxresdefault.jpg"),

  ItemList("CHICKEN TIKKA","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/Chicken-Tikka-Instant-Pot-Crisplid-Piping-Pot-Curry.jpg?alt=media&token=4404403c-7518-4ba0-97ba-d881a16623d4"),

  ItemList("CHICKEN KABAB","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/Soya-Kebab-.jpg?alt=media&token=188eb404-2bf8-4c7d-9c13-67d70a90e60c"),

  ItemList("FISH FRY","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images.jpg?alt=media&token=b54892c1-dddf-4de6-89b2-4250d1249e12"),

  ItemList("KADHAI CHICKEN","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/download%20(4).jpg?alt=media&token=ffaa5ed6-500f-4dea-acab-fd518dd40024"),

  ItemList("ITALIAN","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(2).jpg?alt=media&token=8891b8e4-0f3f-4486-be39-306bc3339159"),

  ItemList("ITALIAN","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/italian-cuisine-47-1440x600.jpg?alt=media&token=ce37acd6-0df6-47ad-a8bb-7efda2377e61"),

  ItemList("Soup","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/3.-Bean-Sprout-Soup-Recipe.jpg?alt=media&token=8bfb79a8-b1c2-421b-96c5-aebc4852ec00"),

  ItemList("PIZZA","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(3).jpg?alt=media&token=4044a9ff-7c63-4513-9541-0f30cedaeb21"),

  ItemList("BURGER","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/delicious-grilled-burgers-260nw-1146199442.webp?alt=media&token=ca0cd09e-d676-4be4-9575-6033c66ec00d"),

  ItemList("NOODLES","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(4).jpg?alt=media&token=81a3ae44-6bcf-4357-9975-7f248daf64bd"),

  ItemList("PASTA","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(5).jpg?alt=media&token=b50397c8-483c-404b-886f-7ed29d6d3e6d"),

  ItemList("CHICKEN CHILLY","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/download.jpg?alt=media&token=6112b9ba-be0a-4d6d-9dbf-46f4ab0ea440"),

  ItemList("PANEER CHILLY","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/chilli-paneer-dry-recipe-10.-500x500.jpg?alt=media&token=25e280b9-9d24-4f0d-845c-21ed9d6c978e"),

  ItemList("GUPCHUP","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(6).jpg?alt=media&token=13b7c748-bc9c-441c-a378-8cb23afb83c2"),

  ItemList("CHAT","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/Samosa-Chaat-2-3.jpg?alt=media&token=3415e9b6-bad5-4f7a-95d9-88a3cf556269"),

  ItemList("MIX VEG","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(7).jpg?alt=media&token=92dfa115-af37-4c70-8af1-37a5373dc83b"),

  ItemList("MUTTON","https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/images%20(8).jpg?alt=media&token=210e01cf-ab73-4c78-9416-46fe5a919c37"),

];


class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: Scaffold(
         backgroundColor: Colors.white,
         appBar: AppBar(
              backgroundColor: Colors.orange,
              centerTitle: true,
              title: Text("FOOD ITEMS",
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
              children: products.map((e){

                 return Container(
                   child: Column(
                     children: [
                       Expanded(child: Container(
                          height: 50,
                          padding: EdgeInsets.all(8),
                          child: Image.network(e.img!,
                          fit: BoxFit.cover,),

                       ),
                       ),
                       Text(e.name!,
                       style: TextStyle(
                         fontSize: 20,
                         
                       ),),
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