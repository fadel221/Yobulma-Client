import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yobulma/constante.dart/colors.dart';
import 'package:yobulma/pages/animations/delayed_animation.dart';
import 'package:yobulma/pages/login/login_screen.dart';

class Screenplash extends StatefulWidget {
  const Screenplash({Key? key}) : super(key: key);

  @override
  _ScreenplashState createState() => _ScreenplashState();
}

class _ScreenplashState extends State<Screenplash>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // if (mounted) {
    //   prefs.loadByKey('nb_notif').then((value) {
    //     if (value == null) {
    //       prefs.saveByKey('nb_notif', '0');
    //     }
    //   });
    //   prefs.loadData().then((value) {
    //     //print(value);
    //     if (value != false) {
    //       prefs.loadByKey('telephone').then((value) {
    //         setState(() {
    //           telephone = value;
    //           prefs.loadByKey('password').then((value) {
    //             setState(() {
    //               password = value;
    //               userservice
    //                   .userlogin(
    //                       'users/loginwithphonenumber', telephone, password)
    //                   .then((value) {
    //                 if (value.statusCode == 200) {
    //                   setState(() {
    //                     var jsonData = jsonDecode(value.body);
    //                     prefs.saveData(jsonData);
    //                     prefs.loadData().then((value) {
    //                       setState(() {
    //                         user = value.user;
    //                       });
    //                     });
    //                   });
    //                   Navigator.pushAndRemoveUntil(
    //                       context,
    //                       MaterialPageRoute(
    //                           builder: (BuildContext context) =>
    //                               const Homepage()),
    //                       ModalRoute.withName(''));
    //                 }
    //               });
    //             });
    //           });
    //         });
    //       });
    //     } else {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginScreen()),
            ModalRoute.withName('')));
    //      }
    //    });
    //  }
  }

  @override
  Widget build(BuildContext context) {
    //final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: black.withOpacity(0.33),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/circle1.png',
                      ))),
            ),
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: DelayedAnimation(
                          delay: 2000,
                          child: CircleAvatar(
                            backgroundColor: Colors.white30,
                            radius: 107.0,
                            child: Image(
                              image: AssetImage('assets/images/logo2a.png'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      DelayedAnimation(
                        delay: 2000,
                        child: Text(
                          "Yobulma",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Pacifico",
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Platform.isAndroid
                          ? const CircularProgressIndicator(
                              color: white,
                            )
                          : const CupertinoActivityIndicator(),
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                      const Text(
                        "Livraison Rapide \n Pour Tout Le Monde",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Source Sans Pro',
                            letterSpacing: 2.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
