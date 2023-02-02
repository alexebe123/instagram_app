import 'package:flutter/material.dart';
import 'package:instagram_app/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Notifiers/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
      title: 'Instagram',  debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:  SplashScreen.screenRoute,
      routes: {
        SplashScreen.screenRoute : (context) => const SplashScreen(),
      },
    );},),);
  }
}
