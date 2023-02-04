import 'package:flutter/material.dart';
import 'package:instagram_app/Notifiers/api_service_firebase.dart';
import 'package:instagram_app/res/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(children: [
            Image.asset('assets/images/logos_instagram.png', width: 50.w),
            SizedBox(
              width: 17.w,
            ),
            Image.asset('assets/images/Add.png'),
            SizedBox(
              width: 3.w,
            ),
            Image.asset('assets/images/favorit.png'),
            SizedBox(
              width: 3.w,
            ),
            Image.asset('assets/images/massenger.png'),
          ]),
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15.w,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(55),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55)),
                            child: Image.network(
                                Provider.of<ApiServiceFirebase>(context)
                                    .user!
                                    .photoURL!),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child:const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Your story",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Inter"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Container(
          color: AppConstants.colorGraySucnd,
          width: 100.w,
          height: 0.2.h,
        )
      ],
    );
  }
}
