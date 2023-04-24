import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/Cart_Screen/Modal/cart_modal.dart';
import 'package:shoping_app/Cart_Screen/Provider/cart_provider.dart';

class CartFinal extends StatefulWidget {
  const CartFinal({Key? key}) : super(key: key);

  @override
  State<CartFinal> createState() => _CartFinalState();
}

class _CartFinalState extends State<CartFinal> {
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
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        backgroundColor: Color(0xff070D2D),
        title: Text(
          "Buy List",
          style: TextStyle(
              fontFamily: 'popins',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          itemBuilder: (context, index) => printview(index),
          itemCount: providerTrue!.finalInfo.length,
        ),
      ),
    ));
  }

  Widget printview(int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 182,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Container(
            height: 145,
            width: 110,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.white, spreadRadius: 2, blurRadius: 1)
            ]),
            child: Image.asset("${providerFalse!.finalInfo[index].image}"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            child: Container(
              width: 340,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${providerFalse!.finalInfo[index].name}",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontFamily: 'popins',
                        fontSize: 20),
                  ),
                  Text(
                    "${providerFalse!.finalInfo[index].len}",
                    style: TextStyle(
                        color: Colors.white54,
                        letterSpacing: 1,
                        fontFamily: 'popins',
                        fontSize: 15),
                  ),
                  Text(
                    "${providerFalse!.finalInfo[index].lenth}",
                    style: TextStyle(
                        color: Colors.white54,
                        letterSpacing: 1,
                        fontFamily: 'popins',
                        fontSize: 15),
                  ),
                  Text(
                    "Surat",
                    style: TextStyle(
                        color: Colors.white54,
                        letterSpacing: 1,
                        fontFamily: 'popins',
                        fontSize: 15),
                  ),
                  Row(
                    children: [
                      Text(
                        "₹ ${(providerTrue!.finalInfo[index].price)! * (providerTrue!.finalInfo[index].qa!)}",
                        style: TextStyle(
                            color: Colors.white70,
                            letterSpacing: 1,
                            fontFamily: 'popins',
                            fontSize: 15),
                      ),
                      Spacer(),
                      Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                providerFalse!.minus(index);
                                },
                                icon: Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.white,
                                  size: 25,
                                )),
                            Text(
                              "${providerTrue!.finalInfo[index].qa}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'popins',
                                  fontSize: 15),
                            ),
                            IconButton(
                                onPressed: () {
                                  providerFalse!.add(index);
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                  size: 25,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
