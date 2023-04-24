import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/Cart_Screen/Provider/cart_provider.dart';
import 'package:shoping_app/Cart_Screen/View/cart_final.dart';
import 'package:shoping_app/Cart_Screen/View/cart_info.dart';
import 'package:shoping_app/Cart_Screen/View/cart_screen.dart';
import 'package:shoping_app/Cart_Screen/View/cart_splash_screen.dart';
void main()
{
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CartProvider(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => SpalshScreen(),
       'main':(context) => HomeScreen(),
       'info':(context) => CartInfo(),
       'final':(context) => CartFinal(),
      },
    ),
  ));
}