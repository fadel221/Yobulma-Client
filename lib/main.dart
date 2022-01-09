import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yobulma/pages/login/login_screen.dart';
import 'package:yobulma/pages/screenplash/Screenplash.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LivreurBi',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent, elevation: 0),
        unselectedWidgetColor: Colors.red,
        cupertinoOverrideTheme: const CupertinoThemeData(
            brightness: Brightness.dark, primaryColor: Colors.white),
        primaryColor: Colors.purple[900],
        scaffoldBackgroundColor: Colors.purple[900],
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.purple.shade700),
      ),
      home: const Screenplash(),
      routes: {
        "/login": (context) => const LoginScreen(),
        /*  "/inscription": (context) => const SignupScreen(), */
      },
    );
  }
}
