import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:shoping_app/Cart_Screen/Modal/cart_modal.dart';

class CartProvider extends ChangeNotifier {
  void buy(int index) {
    CartModel c1 = CartModel(
        price: movieInfo[index].price,
        image: movieInfo[index].image,
        name: movieInfo[index].name,
        director: movieInfo[index].director,
        qa: 1,
        lenth: movieInfo[index].lenth,
        len: movieInfo[index].len);
    finalInfo.add(c1);
    notifyListeners();
  }

  void minus(int index) {
    CartModel c1 = CartModel(
      len: finalInfo[index].len,
      lenth: finalInfo[index].lenth,
      qa: finalInfo[index].qa! - 1,
      director: finalInfo[index].director,
      name: finalInfo[index].name,
      image: finalInfo[index].image,
      price: finalInfo[index].price,
    );

    if(finalInfo[index].qa!<=1)
      {
        finalInfo.removeAt(index);
      }
    else
      {
        finalInfo[index] = c1;
      }
    notifyListeners();
  }

  void add(int index) {
    CartModel c1 = CartModel(
      len: finalInfo[index].len,
      lenth: finalInfo[index].lenth,
      qa: finalInfo[index].qa! + 1,
      director: finalInfo[index].director,
      name: finalInfo[index].name,
      image: finalInfo[index].image,
      price: finalInfo[index].price,
    );
    finalInfo[index] = c1;
    notifyListeners();
  }

  List emoji = [
    "assets/images/shocked.png",
    "assets/images/emoji.png",
    "assets/images/laughing.png",
    "assets/images/surprised.png",
    "assets/images/angry.png",
  ];
  List<CartModel> movieInfo = [
    CartModel(
        name: "Brahmastra - Part One Shiva",
        image: "assets/images/1.jpg",
        price: 499,
        qa: 1,
        director: "Ayan Mukerji",
        len: 'Hindi',
        lenth: "2h 47m"),
    CartModel(
        name: "KGF Chapter 2",
        image: "assets/images/2.jpg",
        price: 699,
        qa: 1,
        director: "Prashanth Neel",
        len: 'Kannada, Hindi',
        lenth: "2h 48m"),
    CartModel(
        name: "Pathaan",
        image: "assets/images/3.jpg",
        price: 699,
        qa: 1,
        director: "Siddharth Anand",
        len: 'Hindi',
        lenth: "2h 26m"),
    CartModel(
        name: "Kantara",
        image: "assets/images/4.jpg",
        price: 599,
        qa: 1,
        director: "Rishab Shetty",
        len: 'Kannada, Hindi',
        lenth: "2h 30m"),
    CartModel(
        name: "Shazam Fury Of The Gods",
        image: "assets/images/5.jpg",
        price: 499,
        qa: 1,
        director: "David F. Sandberg",
        len: 'Hindi',
        lenth: "2h 10m"),
    CartModel(
        name: "Ant-Man-Waps Quantumania",
        image: "assets/images/6.jpg",
        price: 799,
        qa: 1,
        director: "Peyton Reed",
        len: 'English, Hindi',
        lenth: "2h 5m"),
    CartModel(
        name: "Bholaa",
        image: "assets/images/7.jpg",
        price: 399,
        qa: 1,
        director: "Ajay Devgan",
        len: 'Hindi',
        lenth: "2h 24m"),
    CartModel(
        name: "Avatar The Way Of Water",
        image: "assets/images/8.jpg",
        price: 999,
        qa: 1,
        director: "James Cameron",
        len: 'English, Hindi',
        lenth: "3h 12m"),
    CartModel(
        name: "Ram Setu",
        image: "assets/images/9.jpg",
        price: 399,
        qa: 1,
        director: "Abhishek Sharma",
        len: 'Hindi',
        lenth: "2h 20m"),
    CartModel(
        name: "Black Panther Wakanda Forever",
        image: "assets/images/10.jpg",
        price: 799,
        qa: 1,
        director: "Ryan Coogler",
        len: 'English, Hindi',
        lenth: "2h 41m"),
    CartModel(
        name: "Bachchhan Paandey",
        image: "assets/images/11.jpg",
        price: 499,
        qa: 1,
        director: "Farhad Samji",
        len: 'Hindi',
        lenth: "2h 26m"),
    CartModel(
        name: "Vash",
        image: "assets/images/12.jpg",
        price: 499,
        qa: 1,
        director: "Krishnadev Yagnik",
        len: 'Gujarati',
        lenth: "1h 57m"),
    CartModel(
        name: "Naadi Dosh",
        image: "assets/images/13.jpg",
        price: 399,
        qa: 1,
        director: "Krishnadev Yagnik",
        len: 'Gujarati',
        lenth: "2h 11m"),
    CartModel(
        name: "Om Mangalam Singlem",
        image: "assets/images/14.jpg",
        price: 399,
        qa: 1,
        director: "Saandeep Patel",
        len: 'Gujarati',
        lenth: "2h 54m"),
    CartModel(
        name: "Gaslight",
        image: "assets/images/15.jpg",
        price: 499,
        qa: 1,
        director: "Pawan Kripalani",
        len: 'Hindi',
        lenth: "1h 51m"),
  ];
  List<CartModel> finalInfo = [];
}
