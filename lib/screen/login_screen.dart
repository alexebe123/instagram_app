import 'package:flutter/material.dart';
import 'package:instagram_app/res/app_constants.dart';
import 'package:instagram_app/screen/splash_screen.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const screenRoute = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String fullNameError = "";
  String passwordError = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Image.asset('assets/images/logos_instagram.png'),
                Container(
                  color: AppConstants.colorGray,
                  width: 80.w,
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        if (fullNameError != "") {
                          setState(() {
                            fullNameError = "";
                          });
                        } else {}
                      },
                      decoration: InputDecoration(
                        hintText: "Phone number, email or username",
                        errorText: (fullNameError == "") ? null : fullNameError,
                        errorStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10.sp),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 5.w),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 10.sp),
                        floatingLabelStyle:
                            TextStyle(color: Colors.black, fontSize: 14.sp),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppConstants.colorGray),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppConstants.colorGray),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  color: AppConstants.colorGray,
                  width: 80.w,
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        if (passwordError != "") {
                          setState(() {
                            passwordError = "";
                          });
                        } else {}
                      },
                      decoration: InputDecoration(
                        hintText: "password",
                        errorText: (passwordError == "") ? null : passwordError,
                        errorStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10.sp),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 5.w),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 10.sp),
                        floatingLabelStyle:
                            TextStyle(color: Colors.black, fontSize: 14.sp),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppConstants.colorGray),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppConstants.colorGray),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppConstants.colorBlue,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: "Inter"),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SplashScreen.screenRoute);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?  ",
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
                SizedBox(
                  height: 5.h,
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
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppConstants.colorBlue,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/_Facebook.png'),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "Sign Up with Facebook",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: "Inter"),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
