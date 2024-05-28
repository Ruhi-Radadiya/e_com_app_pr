import 'package:e_commerce_app/assets/ad.dart';
import 'package:e_commerce_app/assets/category.dart';
import 'package:e_commerce_app/assets/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart.';

import '../assets/utills/routes.dart';

class homePage3 extends StatefulWidget {
  const homePage3({super.key});

  @override
  State<homePage3> createState() => _homePage3State();
}

class _homePage3State extends State<homePage3> {
  @override
  void initState() {
    super.initState();
    if (!category.contains("All")) {
      category.insert(0, "All");
    }

    if (!categoryImage.contains("assets/icon/all (1).png")) {
      categoryImage.insert(0, "assets/icon/all (1).png");
    }
  }

  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.cart_page);
                      },
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    const Icon(Icons.menu),
                  ],
                ),
                Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: textScaler.scale(35),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: h * 0.015,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...category.map(
                        (e) => myCategory(
                          category2: e,
                          textScaler: textScaler,
                          index: category.indexOf(e),
                          setState: () {
                            setState(() {});
                          },
                          icon: e,
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...adData.map(
                        (e) => adList(
                          context: context,
                          textScaler: textScaler,
                          image: e['image'],
                          text1: e['text1'],
                          text2: e['text2'],
                          text3: e['text3'],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      radius: w * 0.01,
                    ),
                    SizedBox(
                      width: w * 0.01,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      radius: w * 0.013,
                    ),
                    SizedBox(
                      width: w * 0.01,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.brown.shade400,
                      radius: w * 0.02,
                    ),
                    SizedBox(
                      width: w * 0.01,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      radius: w * 0.013,
                    ),
                    SizedBox(
                      width: w * 0.01,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      radius: w * 0.01,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Products",
                      style: TextStyle(
                          fontSize: textScaler.scale(15),
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: w * 0.3,
                    ),
                    Text(
                      "Popular",
                      style: TextStyle(
                          fontSize: textScaler.scale(16),
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                    SizedBox(
                      width: w * 0.03,
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.015,
                ),
                if (cat == 'All') ...[
                  Column(
                    children: [
                      ...category.map(
                        (e) => myProducts(
                          textScaler: textScaler,
                          setState: () {
                            setState(() {});
                          },
                          context: context,
                          category: e,
                        ),
                      ),
                    ],
                  )
                ] else ...[
                  myProducts(
                    textScaler: textScaler,
                    setState: () {
                      setState(() {});
                    },
                    context: context,
                    category: cat,
                  ),
                ]
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: w,
          height: h * 0.08,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              const Spacer(),
              Icon(
                Icons.home_outlined,
                color: Colors.grey,
                size: h * 0.04,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.cart_page);
                },
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.grey,
                  size: h * 0.04,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.favorite_outline_rounded,
                color: Colors.grey,
                size: h * 0.04,
              ),
              const Spacer(),
              Icon(
                Icons.person_2_outlined,
                color: Colors.grey,
                size: h * 0.04,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
