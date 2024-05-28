import 'package:e_commerce_app/HomePage/home_page1.dart';
import 'package:e_commerce_app/HomePage/home_page2.dart';
import 'package:e_commerce_app/HomePage/home_page3.dart';
import 'package:e_commerce_app/cart_page/cart_page.dart';
import 'package:e_commerce_app/detail_page/detail_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static String home_page1 = '/';
  static String home_page2 = 'homepage2';
  static String home_page3 = 'homepage3';
  static String detail_page = 'detailpage';
  static String cart_page = 'cartpage';

  static Map<String, WidgetBuilder> myRoutes = {
    home_page1: (context) => const homePage1(),
    home_page2: (context) => const homePage2(),
    home_page3: (context) => const homePage3(),
    detail_page: (context) => const detailPage(),
    cart_page: (context) => const cartPage(),
  };
}
