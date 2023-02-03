import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_app/res/app_constants.dart';
import 'package:instagram_app/screen/login_screen.dart';
import 'package:instagram_app/screen/main_screen.dart';
import 'package:instagram_app/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Notifiers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppConstants.colorBlue));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Instagram',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: SplashScreen.screenRoute,
            routes: {
              SplashScreen.screenRoute: (context) => const SplashScreen(),
              LoginScreen.screenRoute: (context) => const LoginScreen(),
              MainScreen.screenRoute: (context) => const MainScreen(),
            },
          );
        },
      ),
    );
  }
}
