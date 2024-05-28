import 'package:e_commerce_app/HomePage/home_page1.dart';
import 'package:e_commerce_app/HomePage/home_page3.dart';
import 'package:flutter/material.dart';

class homePage2 extends StatelessWidget {
  const homePage2({super.key});

  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        splashColor: Colors.grey.shade100,
                        onTap: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => homePage1());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade700),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Create account!",
                    style: TextStyle(
                      fontSize: textScaler.scale(25),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "Sign up for your account",
                    style: TextStyle(
                        fontSize: textScaler.scale(13),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: h * 0.06,
                  ),
                  Container(
                    height: h * 0.06,
                    width: w,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: w * 0.001,
                        ),
                        top: BorderSide.none,
                        left: BorderSide.none,
                        right: BorderSide.none,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your Email",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: textScaler.scale(15),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Container(
                    height: h * 0.06,
                    width: w,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: w * 0.001,
                        ),
                        top: BorderSide.none,
                        left: BorderSide.none,
                        right: BorderSide.none,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: textScaler.scale(15),
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                          size: h * 0.03,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot?",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: textScaler.scale(12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.027,
                  ),
                  Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xfff2c972),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 1),
                          blurRadius: 12.0,
                          spreadRadius: 0.3,
                        )
                      ],
                    ),
                    child: InkWell(
                      splashColor: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        Route route = MaterialPageRoute(
                          builder: (context) => homePage3(),
                        );
                        Navigator.push(context, route);
                      },
                      child: Container(
                        height: h * 0.06,
                        width: w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: textScaler.scale(15),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.027,
                  ),
                  Container(
                    height: h * 0.06,
                    width: w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue with facebook",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: textScaler.scale(15),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: h * 0.396,
              width: w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_page/img.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  repeat: ImageRepeat.repeat,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
