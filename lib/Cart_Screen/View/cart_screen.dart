import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/Cart_Screen/Provider/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CartProvider? providerTrue;
  CartProvider? providerFalse;

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<CartProvider>(context, listen: true);
    providerFalse = Provider.of<CartProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff070D2D),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff070D2D),
        title: Text(
          "Hi, Emma!",
          style: TextStyle(
              fontFamily: 'popins',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 20,
                backgroundImage: AssetImage("assets/images/emma.jpg")),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white38),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.search_rounded,
                      color: Colors.white60,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Search your movie",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'popins',
                          color: Colors.white60,
                          letterSpacing: 1),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'popins',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  Text(
                    "See more",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'popins',
                        fontSize: 10,
                        letterSpacing: 1),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  emoji("${providerFalse!.emoji[0]}", "Horror"),
                  emoji("${providerFalse!.emoji[1]}", "Romance"),
                  emoji("${providerFalse!.emoji[2]}", "Comedy"),
                  emoji("${providerFalse!.emoji[3]}", "Drama"),
                  emoji("${providerFalse!.emoji[4]}", "Action"),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'popins',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  Text(
                    "See more",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'popins',
                        fontSize: 10,
                        letterSpacing: 1),
                  )
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                  height: 310,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => moviePoster(index),
                    itemCount: providerFalse!.movieInfo.length,
                  )),
              SizedBox(height: 20),
              Container(
                height: 50,width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.menu,color: Colors.white38,size: 25,),
                    Icon(Icons.play_circle_outline_outlined,color: Colors.white38,size: 25,),
                    Icon(Icons.home_filled,color: Colors.white,size: 25,),
                    IconButton(onPressed: () {
                      Navigator.pushNamed(context, 'final');
                    }, icon: Icon(Icons.shopping_cart_outlined,color: Colors.white38,size: 25,),),
                    Icon(Icons.person,color: Colors.white38,size: 25,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
  Widget emoji(String emoji, String name) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(color: Colors.white10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("$emoji", height: 30, width: 30),
              Text("$name",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'popins',
                      letterSpacing: 1,
                      fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
  Widget moviePoster(int index) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'info',arguments: index);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 200,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.asset(
                  "${providerFalse!.movieInfo[index].image}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 50,
            width: 150,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${providerFalse!.movieInfo[index].name}",
                style: TextStyle(
                    color: Colors.white, letterSpacing: 1, fontFamily: 'popins'),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 10,
              width: 150,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/star.png",
                      height: 10,
                      width: 10,
                    ),
                    SizedBox(width: 5),
                    Image.asset(
                      "assets/images/star.png",
                      height: 10,
                      width: 10,
                    ),
                    SizedBox(width: 5),
                    Image.asset(
                      "assets/images/star.png",
                      height: 10,
                      width: 10,
                    ),
                    SizedBox(width: 5),
                    Image.asset(
                      "assets/images/star.png",
                      height: 10,
                      width: 10,
                    ),
                    SizedBox(width: 5),
                    Image.asset(
                      "assets/images/star.png",
                      height: 10,
                      width: 10,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
