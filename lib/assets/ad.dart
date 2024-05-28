import 'package:flutter/material.dart';

Widget adList({
  required BuildContext context,
  required TextScaler textScaler,
  required String image,
  required String text1,
  required String text2,
  required String text3,
}) {
  double h = MediaQuery.sizeOf(context).height;
  double w = MediaQuery.sizeOf(context).width;
  return Center(
    child: Container(
      margin: EdgeInsets.only(right: 12),
      height: h * 0.24,
      width: w * 0.91,
      decoration: BoxDecoration(
        color: Colors.brown.shade200,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          scale: 2,
          alignment: Alignment.bottomRight,
          image: AssetImage(image),
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                  fontSize: textScaler.scale(20),
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Text(
                text2,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: textScaler.scale(17),
                    fontWeight: FontWeight.w700),
              ),
              Text(
                text3,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: textScaler.scale(17),
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                height: h * 0.05,
                width: w * 0.3,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Shop now",
                  style: TextStyle(
                      fontSize: textScaler.scale(15),
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

List<Map> adData = [
  {
    'image': "assets/images/imagead/1.png",
    'text1': "BIG SALE!",
    'text2': "Get 50% of on",
    'text3': "Meg Sunday Sale!",
  },
  {
    'image': "assets/images/imagead/img_15.png",
    'text1': "\$999!",
    'text2': "Starting From Just",
    'text3': "\$ 999!",
  },
  {
    'image': "assets/images/imagead/3.png",
    'text1': "NEW!",
    'text2': "Grab Our New",
    'text3': "Collection Quickly!",
  },
  {
    'image': "assets/images/imagead/img_2.png",
    'text1': "CASHBACK!",
    'text2': "Get a Cashback On",
    'text3': "Online Payment!",
  },
  {
    'image': "assets/images/imagead/img_3.png",
    'text1': "DISCOUNT!",
    'text2': "Get a Big Discount",
    'text3': "On Your First Order!",
  },
  {
    'image': "assets/images/imagead/img_4.png",
    'text1': "FREE!",
    'text2': "Get a Free Plants",
    'text3': "On Your Big Order!",
  },
];
