import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../res/app_constants.dart';
import '../widget/main/sections/home_sction.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const screenRoute = 'main_screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: const [
            // LibrarySection(),
            HomeSection(),
          ],
        ),
        Builder(builder: (context) {
          return Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppConstants.colorGray)),
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // home icon
                    GestureDetector(
                      onTap: () {
                        setBottomBarIndex(0);
                      },
                      child: (currentIndex == 0)
                          ? Image.asset('assets/images/Home.png')
                          : Image.asset('assets/images/Home_bold.png'),
                    ),

                    GestureDetector(
                      onTap: () {
                        setBottomBarIndex(1);
                      },
                      child: (currentIndex == 1)
                          ? Image.asset('assets/images/Search_bold.png')
                          : Image.asset('assets/images/Search.png'),
                    ),

                    GestureDetector(
                      onTap: () {
                        setBottomBarIndex(2);
                      },
                      child: (currentIndex == 2)
                          ? Image.asset('assets/images/Reels_bold.png')
                          : Image.asset('assets/images/Reels.png'),
                    ),

                    GestureDetector(
                      onTap: () {
                        setBottomBarIndex(3);
                      },
                      child: (currentIndex == 3)
                          ? Image.asset('assets/images/Shopping_bold.png')
                          : Image.asset('assets/images/Shopping.png'),
                    ),

                    GestureDetector(
                      onTap: () {
                        setBottomBarIndex(4);
                      },
                      child: Icon(
                        (currentIndex == 4)
                            ? Icons.account_box
                            : Icons.account_box_outlined,
                        size: 5.h,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ]),
    );
  }
}
