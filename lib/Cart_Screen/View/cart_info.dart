import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/Cart_Screen/Modal/cart_modal.dart';
import 'package:shoping_app/Cart_Screen/Provider/cart_provider.dart';

class CartInfo extends StatefulWidget {
  const CartInfo({Key? key}) : super(key: key);

  @override
  State<CartInfo> createState() => _CartInfoState();
}

class _CartInfoState extends State<CartInfo> {
  CartProvider? providerTrue;
  CartProvider? providerFalse;

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<CartProvider>(context, listen: true);
    providerFalse = Provider.of<CartProvider>(context, listen: false);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff070D2D),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        backgroundColor: Color(0xff070D2D),
        title: Text(
          "Detail movie",
          style: TextStyle(
              fontFamily: 'popins',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            SizedBox(height: 25),
            Stack(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    height: 440,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.10),
                  child: Container(
                    height: 430,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.20),
                  child: Container(
                    height: 420,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(30)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                            '${providerFalse!.movieInfo[index].image}',
                            fit: BoxFit.fill)),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${providerFalse!.movieInfo[index].name}",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontFamily: 'popins',
                    fontSize: 25),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Director : ${providerFalse!.movieInfo[index].director}",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontFamily: 'popins',
                    fontSize: 12),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${providerFalse!.movieInfo[index].len}",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontFamily: 'popins',
                    fontSize: 12),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${providerFalse!.movieInfo[index].lenth}",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontFamily: 'popins',
                    fontSize: 12),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Rating : 5.0",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontFamily: 'popins',
                      fontSize: 12),
                ),
                SizedBox(width: 10),
                Image.asset(
                  "assets/images/star.png",
                  height: 13,
                  width: 13,
                ),
              ],
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                providerFalse!.buy(index);
                Navigator.pushReplacementNamed(context, 'final');
              },
              child: Container(
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Buy Ticket",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 1,
                        fontFamily: 'popins'),
                  ),
                ),
            ))
          ]),
        ),
      ),
    ));
  }
}
