import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
//  import 'package:livreur/animations/DelayedAnimation.dart';
//  import 'package:livreur/constantes/color/color.dart';
//  import 'package:livreur/constantes/error_message.dart';
//  import 'package:livreur/constantes/usefull_variables.dart';
//  import 'package:livreur/pages/Home/homepage.dart';
//  import 'package:livreur/pages/otp/otp_forget_password.dart';
//  import 'package:livreur/pages/otp/otp_verification.dart';
import 'package:lottie/lottie.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:yobulma/constante.dart/colors.dart';
import 'package:yobulma/pages/animations/delayed_animation.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:sliver_tools/sliver_tools.dart';
import 'package:yobulma/services/functions.dart';

//import '../../homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _telephone = '';
  String _password = '';
  bool _vraie = true;
  bool _motDePassVisible = true;
  bool snackbar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              stretch: true,
              pinned: true,
              snap: true,
              floating: true,
              backgroundColor: Colors.purple.shade900,
              automaticallyImplyLeading: false,
              expandedHeight: getHeigth(context) * 0.5,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.fadeTitle,
                  StretchMode.blurBackground,
                ],
                title: Text(
                  'Connexion',
                  style: TextStyle(
                      color: Colors.grey[400], fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                background: DecoratedBox(
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                        Colors.purple.shade900,
                        Colors.transparent
                      ])),
                  child: Lottie.asset('assets/images/livreurBg.json',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SliverStack(children: <Widget>[
              SliverToBoxAdapter(
                child: DelayedAnimation(
                  delay: 1,
                  child: Container(
                    height: getHeigth(context) * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/circle1.png'))),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(30.0),
                sliver: MultiSliver(children: <Widget>[
                  DelayedAnimation(
                    delay: 2,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .33),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey.shade100,
                            ))),
                            child: IntlPhoneField(
                                showDropdownIcon: false,
                                searchText: 'Recherche par nom de pays',
                                // dropDownArrowColor: kPrimaryColor,
                                decoration: const InputDecoration(
                                  hintText: 'Numéro de téléphone',
                                ),
                                initialCountryCode: 'SN',
                                countries: const ['SN'],
                                onChanged: (phone) {
                                  //  print(phone.completeNumber);
                                  setState(() {
                                    _telephone = phone.completeNumber;
                                  });
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                                obscureText: _motDePassVisible,
                                onChanged: (value) {
                                  setState(() {
                                    _password = value;
                                  });
                                },
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(
                                  hintText: "Mot de Passe",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  icon: const Icon(
                                    Icons.lock,
                                    color: kPrimaryColor,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _motDePassVisible = !_motDePassVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _motDePassVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Platform.isAndroid ? 10 : 30,
                  ),
                  SliverToBoxAdapter(
                    child: DelayedAnimation(
                      delay: 3,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _authenticate();
                          });
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, .1),
                                  Color.fromRGBO(143, 148, 251, .6)
                                ],
                              )),
                          child: Center(
                            child: _vraie
                                ? const Text(
                                    'Se connecter',
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Platform.isAndroid
                                    ? const CircularProgressIndicator(
                                        color: white,
                                      )
                                    : const CupertinoActivityIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Platform.isAndroid ? 30 : 50,
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: DelayedAnimation(
                        delay: 1,
                        child: GestureDetector(
                          onTap: () {
                            //_motDepassOublier();
                          },
                          child: const Text(
                            'Mot de passe oublier ?',
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*  const SizedBox(
                    height: 25,
                  ),
                  SliverToBoxAdapter(
                      child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Pas de compte ? ',
                            style: TextStyle(
                              color: white,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await launch(
                                'https://www.livreurbi.com/auth/inscriptions/livreur',
                                forceWebView: true,
                                enableJavaScript: true,
                                statusBarBrightness: Brightness.light);
                          },
                          child: const Text(
                            'Inscription',
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                        )
                      ],
                    ),
                  )) */
                ]),
              )
            ])
          ],
        ),
      ),
    );
  }

  /// Function authentification et stockage de donnéEs
  void _authenticate() {
    setState(() {
      _vraie = false;
    });
    // Si le numero et le password est different de  vide
    if (_telephone != "" && _password != "") {
      // Si le nombre de caractére du numéro de téléphone est inferieur à 13
      if (_telephone.length < 13) {
        setState(() {
          _vraie = true;
        });
        final snackBar = SnackBar(
            backgroundColor: Colors.red.shade400,
            duration: const Duration(seconds: 3),
            content: const Text('Numéro de téléphone incorecte'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      //  Sinon Si le password est inferieur à 8
      else if (_password.length < 8) {
        setState(() {
          _vraie = true;
        });
        final snackBar = SnackBar(
            backgroundColor: Colors.red.shade400,
            duration: const Duration(seconds: 4),
            content: const Text(
                "Le mot de passe doit contenir au moins 8 caratères."));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      // Sinon execute la fonction de l'authentification
      // else {
      //   userservice
      //       .userlogin('users/loginwithphonenumber', _telephone, _password)
      //       .then((value) => {
      //             setState(() {
      //               //print(value["error"]);
      //               //_loading = !_loading;
      //               var jsonData = jsonDecode(value.body);
      //               //  print(jsonData);
      //               //  Si le response du backend envoi un status 200
      //               if (value.statusCode == 200) {
      //                 prefs.saveTelephoneAndPassword(_telephone, _password);
      //                 if (jsonData['user']['roles'][0] == 'ROLE_CLIENT' ||
      //                     jsonData['user']['roles'][0] == 'ROLE_MARCHAND') {
      //                   setState(() {
      //                     _vraie = true;
      //                   });
      //                   final snackBar = SnackBar(
      //                       backgroundColor: Colors.red.shade400,
      //                       duration: const Duration(seconds: 3),
      //                       content: const Text(
      //                           "Ce compte n'est pas inscrit en tant que compte livreur. Veuillez nous contactez svp."));
      //                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //                 } else {
      //                   prefs.saveData(jsonData);
      //                   prefs.saveTelephoneAndPassword(_telephone, _password);
      //                   prefs.loadData().then((value) {
      //                     setState(() {
      //                       user = value.user;
      //                       final snackBar = SnackBar(
      //                           backgroundColor: bg,
      //                           duration: const Duration(seconds: 2),
      //                           content: Text(
      //                               'Bienvenue! ${jsonData['user']['prenom']!} ${jsonData['user']['nom']!}'));
      //                       ScaffoldMessenger.of(context)
      //                           .showSnackBar(snackBar);
      //                       //data = value;
      //                       Timer(
      //                           const Duration(seconds: 2),
      //                           () => {
      //                                 setState(() {
      //                                   _vraie = true;
      //                                 }),
      //                                 Navigator.pushAndRemoveUntil(
      //                                     context,
      //                                     MaterialPageRoute(
      //                                         builder: (BuildContext context) =>
      //                                             const Homepage()),
      //                                     ModalRoute.withName('')),
      //                               });
      //                     });
      //                   });
      //                 }
      //               }
      //               // Sinon si en cas d'erreur verifie si le message d'erreur est égale à compteNonActive

      //               else if (jsonData['error']['message'] == compteNonActive) {
      //                 setState(() {
      //                   _vraie = true;
      //                 });
      //                 final snackBar = SnackBar(
      //                     backgroundColor: bg,
      //                     duration: const Duration(seconds: 3),
      //                     content: Text(jsonData['error']['message']));
      //                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //                 Timer(
      //                     const Duration(seconds: 3),
      //                     () => Navigator.pushAndRemoveUntil(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (BuildContext context) =>
      //                                 OtpVerificationn(_telephone)),
      //                         ModalRoute.withName('')));
      //               }
      //               // Sinon si verifie si le status code est égale à 422
      //               else if (jsonData['error']['statusCode'] == 422) {
      //                 setState(() {
      //                   _vraie = true;
      //                 });
      //                 final snackBar = SnackBar(
      //                     backgroundColor: Colors.red.shade400,
      //                     duration: const Duration(seconds: 4),
      //                     content: const Text(
      //                         "Le mot de passe doit contenir au moins 8 caratères."));
      //                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //               }
      //               //  Sinon envoi le msg d'erreur envoyer par le backend
      //               else {
      //                 setState(() {
      //                   _vraie = true;
      //                 });
      //                 final snackBar = SnackBar(
      //                     backgroundColor: Colors.red.shade400,
      //                     duration: const Duration(seconds: 4),
      //                     content: Text(jsonData['error']['message']));
      //                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //               }
      //             })
      //           })
      //       .catchError((error) => {
      //             //  print('erreur: $error'),

      //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //                 backgroundColor: Colors.red.shade400,
      //                 duration: const Duration(seconds: 4),
      //                 content: Text('$error')))
      //           });
      // }
    }
    //  Sinon Envoi un msg d'erreur de champ vide
    else {
      setState(() {
        _vraie = true;
      });
      final snackBar = SnackBar(
          backgroundColor: Colors.red.shade400,
          duration: const Duration(seconds: 2),
          content: const Text(
              "Verifier si vous avez bien renseigné vos informations svp."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  /// Function MOT DE PASSE OUBLIER
  // void _motDepassOublier() {
  //   // Widget Alert
  //   Alert(
  //       closeFunction: () {
  //         _telephone = '';
  //         Navigator.pop(context);
  //       },
  //       onWillPopActive: true,
  //       style: const AlertStyle(
  //           animationDuration: Duration(seconds: 1),
  //           titleStyle: TextStyle(
  //               fontSize: 18.0,
  //               fontWeight: FontWeight.bold,
  //               fontFamily: 'Source Sans Pro'),
  //           descStyle: TextStyle(fontSize: 12.0)),
  //       context: context,
  //       title: "MOT DE PASSE OUBLIÉE",
  //       desc: 'Veuillez saisir votre numéro de téléphone.',
  //       content: Column(
  //         children: <Widget>[
  //           IntlPhoneField(
  //             showDropdownIcon: false,
  //             showCountryFlag: false,
  //             searchText: 'Recherche par nom de pays',
  //             // dropDownArrowColor: kPrimaryColor,
  //             decoration: const InputDecoration(
  //               labelText: 'Téléphone',
  //             ),
  //             initialCountryCode: 'SN',
  //             countries: const ['SN'],
  //             onChanged: (phone) {
  //               //print(phone.completeNumber);

  //               _telephone = phone.completeNumber;
  //             },
  //           ),
  //         ],
  //       ),
  //       buttons: [
  //         DialogButton(
  //           color: Colors.purple.shade900,
  //           onPressed: () async {
  //             //print("numéro $_telephone");
  //             // Si le numéro de téléphone est vide
  //             _telephone != ""
  //                 ?
  //                 // Si le nombre de caractères du numéro téléphone est égale à 13
  //                 _telephone.length == 13
  //                     ? userservice
  //                         .envoiPhone('users/phone/forgotpassword', _telephone)
  //                         .then((value) => {
  //                               //print('data $value'),
  //                               setState(() {
  //                                 var jsonData = jsonDecode(value.body);
  //                                 //_loading = !_loading;
  //                                 // Verifie si le  message d'erreur est different de null
  //                                 if (jsonData['error'] != null) {
  //                                   // Verifie si le  message d'erreur est égale à Internal Server Error
  //                                   if (jsonData['error']['message'] ==
  //                                       'Internal Server Error') {
  //                                     Platform.isAndroid
  //                                         ? showDialog(
  //                                             context: context,
  //                                             builder: (BuildContext context) =>
  //                                                 const AlertDialog(
  //                                               title: Text('Erreur'),
  //                                               content: Text(
  //                                                   'Se numéro n\'est pas inscrite.'),
  //                                             ),
  //                                           )
  //                                         : showCupertinoDialog(
  //                                             barrierDismissible: true,
  //                                             context: context,
  //                                             builder: (BuildContext context) =>
  //                                                 const CupertinoAlertDialog(
  //                                               title: Text('Erreur'),
  //                                               content: Text(
  //                                                   'Se numéro n\'est pas inscrite.'),
  //                                             ),
  //                                           );
  //                                   } else {
  //                                     // Sinon Affiche le Dialog

  //                                     Platform.isAndroid
  //                                         ? showDialog(
  //                                             context: context,
  //                                             builder: (BuildContext context) =>
  //                                                 AlertDialog(
  //                                               title: const Text(''),
  //                                               content: Text(jsonData['error']
  //                                                   ['message']),
  //                                             ),
  //                                           )
  //                                         : showCupertinoDialog(
  //                                             barrierDismissible: true,
  //                                             context: context,
  //                                             builder: (BuildContext context) =>
  //                                                 CupertinoAlertDialog(
  //                                               title: const Text(''),
  //                                               content: Text(jsonData['error']
  //                                                   ['message']),
  //                                             ),
  //                                           );
  //                                   }
  //                                 } else {
  //                                   // Sinon Affiche le Dialog

  //                                   Platform.isAndroid
  //                                       ? showDialog(
  //                                           context: context,
  //                                           builder: (BuildContext context) =>
  //                                               const AlertDialog(
  //                                             title: Text('Envoyé'),
  //                                             content: Text(
  //                                                 'Un code de réinitilisation vous a été envoyer.'),
  //                                           ),
  //                                         )
  //                                       : showCupertinoDialog(
  //                                           barrierDismissible: true,
  //                                           context: context,
  //                                           builder: (BuildContext context) =>
  //                                               const CupertinoAlertDialog(
  //                                             title: Text('Envoyé'),
  //                                             content: Text(
  //                                                 'Un code de réinitilisation vous a été envoyer.'),
  //                                           ),
  //                                         );
  //                                   Timer(
  //                                       const Duration(seconds: 3),
  //                                       () => Navigator.pushAndRemoveUntil(
  //                                           context,
  //                                           MaterialPageRoute(
  //                                               builder: (BuildContext
  //                                                       context) =>
  //                                                   const OtpForgotPassword()),
  //                                           ModalRoute.withName('')));
  //                                 }
  //                               })
  //                             })
  //                     : Platform.isAndroid
  //                         ? showDialog(
  //                             context: context,
  //                             builder: (BuildContext context) =>
  //                                 const AlertDialog(
  //                                   title: Text('Numéro incomplète'),
  //                                   content: Text(
  //                                       'Veuillez saissir un numéro valide.'),
  //                                 ))
  //                         : showCupertinoDialog(
  //                             barrierDismissible: true,
  //                             context: context,
  //                             builder: (BuildContext context) =>
  //                                 const CupertinoAlertDialog(
  //                                   title: Text('Numéro incomplète'),
  //                                   content: Text(
  //                                       'Veuillez saissir un numéro valide.'),
  //                                 ))
  //                 : Platform.isAndroid
  //                     ? showDialog(
  //                         context: context,
  //                         builder: (BuildContext context) => const AlertDialog(
  //                           title: Text('Champ vide'),
  //                           content: Text(
  //                               'Veuillez saisir un numéro de téléphone svp.'),
  //                         ),
  //                       )
  //                     : showCupertinoDialog(
  //                         barrierDismissible: true,
  //                         context: context,
  //                         builder: (BuildContext context) =>
  //                             const CupertinoAlertDialog(
  //                           title: Text('Champ vide'),
  //                           content: Text(
  //                               'Veuillez saisir un numéro de téléphone svp.'),
  //                         ),
  //                       );

  //             /*  final signcode = await SmsAutoFill().getAppSignature;
  //             print(signcode);
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (BuildContext context) => OtpForgotPassword()),
  //                 ModalRoute.withName('')); */
  //           },
  //           child: const Text(
  //             "ENVOYER",
  //             style: TextStyle(color: Colors.white, fontSize: 20),
  //           ),
  //         )
  //       ]).show();
  // }
}
