import 'package:e_commerce_app/assets/list.dart';
import 'package:flutter/material.dart';
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
        body: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Cart",
                style: TextStyle(
                  fontSize: textScaler.scale(35),
                  fontWeight: FontWeight.bold,
                ),
              ),
              (cartList.isNotEmpty)
                  ? Stack(children: [
                      Column(
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
                                      backgroundColor: const Color(0xffFFFFFF),
                                      foregroundColor: Colors.grey,
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
                                      backgroundColor: Colors.grey,
                                      foregroundColor: Colors.white,
                                      icon: Icons.info_outline,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  height: h * 0.15,
                                  width: w,
                                  margin: const EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: h * 0.2,
                                        width: w * 0.3,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                  fontSize:
                                                      textScaler.scale(18),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    e['price'],
                                                    style: TextStyle(
                                                      fontSize:
                                                          textScaler.scale(16),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
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
                                                      height: h * 0.04,
                                                      width: w * 0.095,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffededed),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: w * 0.02,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      if (e['stock'] >
                                                          e['qty']) {
                                                        e['qty']++;
                                                      }

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      height: h * 0.04,
                                                      width: w * 0.095,
                                                      decoration: BoxDecoration(
                                                        color: Colors.brown,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
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
                    ])
                  : Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/cart_empty.png",
                              width: w * 0.5,
                            ),
                            Text(
                              "Your Cart is Lonely",
                              style: TextStyle(
                                fontSize: textScaler.scale(20),
                                fontWeight: FontWeight.w700,
                                color: Colors.brown.shade200,
                              ),
                            ),
                            Text(
                              "Add Some items to cheer it up",
                              style: TextStyle(
                                fontSize: textScaler.scale(12),
                                fontWeight: FontWeight.w700,
                                color: Colors.brown.shade200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}
