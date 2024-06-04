import 'package:e_commerce_app/assets/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart.';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../assets/utills/routes.dart';

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Text(
                    "My Cart",
                    style: TextStyle(
                      fontSize: textScaler.scale(35),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            if (cartList.isNotEmpty) ...[
              Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ...cartList.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      // delete logic
                                      cartList.remove(e);
                                      setState(() {});
                                    },
                                    borderRadius: BorderRadius.circular(12),
                                    foregroundColor: Colors.black26,
                                    backgroundColor: const Color(0xffFFFFFF),
                                    icon: Icons.delete,
                                  ),
                                  SizedBox(
                                    width: h * 0.01,
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {
                                      Navigator.pushNamed(
                                          context, Routes.detail_page,
                                          arguments: e);
                                    },
                                    borderRadius: BorderRadius.circular(12),
                                    backgroundColor: Colors.black26,
                                    foregroundColor: Colors.white,
                                    icon: Icons.info_outline,
                                  ),
                                ],
                              ),
                              child: Container(
                                height: h * 0.12,
                                width: w,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: h * 0.1,
                                      width: w * 0.25,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(e['image']),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e['name'],
                                              style: TextStyle(
                                                fontSize: textScaler.scale(18),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  e['price'],
                                                  style: TextStyle(
                                                    fontSize:
                                                        textScaler.scale(16),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (e['qty'] > 1) {
                                                      e['qty']--;
                                                    } else {
                                                      cartList.remove(e);
                                                    }

                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: h * 0.045,
                                                    width: w * 0.09,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffededed),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Icon(
                                                        Icons.remove),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: w * 0.02,
                                                ),
                                                Text(
                                                  "${e['qty']}",
                                                  style: TextStyle(
                                                    fontSize:
                                                        textScaler.scale(18),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: w * 0.02,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (e['stock'] > e['qty']) {
                                                      e['qty']++;
                                                    }
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: h * 0.045,
                                                    width: w * 0.09,
                                                    decoration: BoxDecoration(
                                                      color: Colors.brown,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ] else ...[
              Expanded(
                child: Container(
                  width: w,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/cart_empty.png",
                          width: w * 0.5,
                        ),
                      ),
                      Text(
                        "Your cart is Lonely",
                        style: TextStyle(
                            fontSize: textScaler.scale(22),
                            fontWeight: FontWeight.w500,
                            color: Colors.brown.shade300),
                      ),
                      Text(
                        "Add Some items to cheer it up",
                        style: TextStyle(
                            fontSize: textScaler.scale(13),
                            fontWeight: FontWeight.w500,
                            color: Colors.brown.shade300),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ],
        ),
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}
