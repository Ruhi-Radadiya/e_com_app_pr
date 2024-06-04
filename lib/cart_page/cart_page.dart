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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: TextStyle(
            fontSize: textScaler.scale(18),
          ),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: (cartList.isNotEmpty)
          ? Stack(
              children: [
                Column(children: [
                  ...cartList.map(
                    (e) => Slidable(
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
                            backgroundColor: const Color(0xfff5d7d9),
                            foregroundColor: Colors.red,
                            icon: Icons.delete,
                          ),
                          SizedBox(
                            width: h * 0.01,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              Navigator.pushNamed(context, Routes.detail_page,
                                  arguments: e);
                            },
                            borderRadius: BorderRadius.circular(12),
                            backgroundColor: Colors.green.withOpacity(0.3),
                            foregroundColor: Colors.green.shade300,
                            icon: Icons.info_outline,
                          ),
                        ],
                      ),
                      child: Container(
                        height: h * 0.1,
                        width: w,
                        margin: const EdgeInsets.all(10),
                        
                        padding: const EdgeInsets.all(10),
                        child: Row(children: [
                          Container(
                            height: h * 0.075,
                            width: w * 0.2,
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
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e['name'],
                                      style: TextStyle(
                                        fontSize: textScaler.scale(18),
                                      ),
                                    ),
                                    Row(children: [
                                      Text(
                                        e['price'],
                                        style: TextStyle(
                                          fontSize: textScaler.scale(16),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                                  ]),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ]),
              ],
            )
          : Center(
              child: Text(
                "No Data Added...",
                style: TextStyle(
                  fontSize: textScaler.scale(22),
                ),
              ),
            ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
