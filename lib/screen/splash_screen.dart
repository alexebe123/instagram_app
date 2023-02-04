import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instagram_app/Notifiers/api_service_firebase.dart';
import 'package:instagram_app/screen/login_screen.dart';
import 'package:instagram_app/screen/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../res/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const screenRoute = 'splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    load();
  }

  Future load() async {
    Future.delayed(const Duration(milliseconds: 200), () {
      Provider.of<ApiServiceFirebase>(context, listen: false).getAccount();
      bool isLoggedIn =
          Provider.of<ApiServiceFirebase>(context, listen: false).isLoggedIn;
      if (isLoggedIn) {
        Navigator.of(context).pushReplacementNamed(MainScreen.screenRoute);
      }
    });
  }

  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 30.h,
          ),
          Image.asset('assets/images/logos_instagram.png'),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Sign up to see photos videos and reels from your friends.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 10.sp, fontFamily: "Inter"),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: GestureDetector(
              onTap: () async {
                await Provider.of<ApiServiceFirebase>(context, listen: false)
                    .signInWithFacebook();

                /*  log(Provider.of<ApiServiceFirebase>(context, listen: false)
                    .user!
                    .photoURL!);
                log(Provider.of<ApiServiceFirebase>(context, listen: false)
                    .user!
                    .displayName!);*/
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: AppConstants.colorBlue,
                ),
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/images/_Facebook.png'),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Continue as shalini",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontFamily: "Inter"),
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              children: [
                Container(
                  color: Colors.grey,
                  width: 40.w,
                  height: 0.2.h,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  "OR",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontFamily: "Inter"),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Container(
                  color: Colors.grey,
                  width: 40.w,
                  height: 0.2.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            "Sign Up With Phone or Email",
            style: TextStyle(
                color: Colors.black,
                fontSize: 10.sp,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 18.h,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(LoginScreen.screenRoute);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontFamily: "Inter"),
                  ),
                  Text(
                    "Sign in.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
