import 'dart:developer';

import 'package:e_commerce_app/assets/list.dart';
import 'package:e_commerce_app/assets/utills/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart.';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

String cat = "All";
Widget myCategory({
  required String category2,
  required TextScaler textScaler,
  required Function() setState,
  required int index,
  required String icon,
  required BuildContext context,
}) {
  double h = MediaQuery.sizeOf(context).height;
  double w = MediaQuery.sizeOf(context).width;
  log("CAT INDEX: ${category.length}");
  log("CAT Image INDEX: ${categoryImage.length}");
  log("INDEX: $index");
  return GestureDetector(
    onTap: () {
      cat = category2;
      setState();
    },
    child: Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: w * 0.1,
            backgroundColor: Colors.brown.shade200,
            child: Image.asset(
              categoryImage[index],
              height: h * 0.05,
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Text(
            category2.replaceFirst(
              category2[0],
              category2[0].toUpperCase(),
            ),
            style: TextStyle(
              fontSize: textScaler.scale(14),
              color: (cat == category2) ? Colors.black : Colors.grey.shade400,
              fontWeight:
                  (cat == category2) ? FontWeight.w900 : FontWeight.w700,
              decoration: (cat == category2)
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationThickness: 1.5,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget myProducts(
    {required TextScaler textScaler,
    required Function() setState,
    required BuildContext context,
    required String category}) {
  double h = MediaQuery.sizeOf(context).height;
  double w = MediaQuery.sizeOf(context).width;
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: const BouncingScrollPhysics(),
    child: Row(
      children: [
        ...myData.map(
          (e) => (e['category'] == category)
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.detail_page,
                        arguments: e,
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: h * 0.22,
                                  width: w * 0.44,
                                  decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius: BorderRadius.circular(18),
                                    image: DecorationImage(
                                        image: AssetImage(e['image']),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Text(
                                  e['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: textScaler.scale(17),
                                      color: Colors.grey.shade700),
                                ),
                                Text(
                                  e['price'].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: textScaler.scale(21),
                                  ),
                                ),
                                RatingBarIndicator(
                                  rating: double.parse(e['rating'].toString()),
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 15.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ),
      ],
    ),
  );
}
