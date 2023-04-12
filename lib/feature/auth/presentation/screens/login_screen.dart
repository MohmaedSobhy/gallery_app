import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../view/frosted_glass_item.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(221, 205, 255, 1),
                Color.fromRGBO(255, 218, 218, 1),
                Color.fromRGBO(234, 148, 215, 1)
              ],
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 50.w,
                  top: 2.h,
                ),
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    const Image(
                      image: AssetImage(
                        "assets/lines.png",
                      ),
                    ),
                    const Image(
                      image: AssetImage(
                        "assets/lines.png",
                      ),
                    ),
                    Positioned(
                      left: 10.w,
                      top: 5.h,
                      child: Image(
                        width: 35.w,
                        image: const AssetImage(
                          "assets/love_photography.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: Text(
                  "My \nGalllery",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const FrosetGlassItem(),
            ],
          ),
        ),
      ),
    );
  }
}
