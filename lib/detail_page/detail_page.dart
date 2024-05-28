import 'dart:developer';

import 'package:e_commerce_app/assets/list.dart';
import 'package:e_commerce_app/assets/utills/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart.';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> pro =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.brown.shade100,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.home_page3);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        "Product Detail",
                        style: TextStyle(
                            fontSize: textScaler.scale(20),
                            fontWeight: FontWeight.w700),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.brown.shade100,
                        child: Icon(
                          Icons.notification_add,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Expanded(
                    child: Image.asset(
                      pro['image'],
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: h * 0.4,
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  border: const Border(
                    top: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 9,
                      offset: const Offset(0, -4),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pro['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: textScaler.scale(20),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Text(
                        "Product Details",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: textScaler.scale(17),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Text(
                        pro['description'],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: textScaler.scale(13),
                        ),
                      ),
                      Divider(),
                      RatingBarIndicator(
                        rating: double.parse(pro['rating'].toString()),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 25.0,
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Total Price",
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: textScaler.scale(18),
                                  ),
                                ),
                                Text(
                                  pro['price'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: textScaler.scale(21),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w * 0.19,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (!cartList.contains(pro)) {
                                  cartList.add(pro);
                                }
                                log("Cart List : $cartList");
                              },
                              child: Container(
                                height: h * 0.06,
                                decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "🛍️ Add to Cart",
                                  style: TextStyle(
                                    fontSize: textScaler.scale(15),
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
