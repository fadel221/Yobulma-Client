import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const bg = Color(0xFF4A148C);
final roundedRectangle12 = RoundedRectangleBorder(
  borderRadius: BorderRadiusDirectional.circular(12),
);
Color mainColor = const Color.fromRGBO(255, 204, 0, 1);
const kPrimaryColor2 = Color(0xFFFF7643);
const headerStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
const titleStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.purple);
const titleStyle2 = TextStyle(fontSize: 16, color: Colors.black45);
const subtitleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
const infoStyle = TextStyle(fontSize: 12, color: Colors.black54);
const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFFFFFFF);
const kDefaultPaddin = 20.0;
const kPrimaryColoru = Color(0xFF0C9869);
const kTextColoru = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);
const double kDefaultPadding = 20.0;
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);
const Color bgButtonWhite = Color(0xffffffff);
const primary = Color(0xFF3c4f76);

const Color black = Color(0xff000000);
const Color white = Color(0xffffffff);
const Color blue = Color(0xff0D47A1);
const Color grey = Color(0xffbdbdbd);
const Color lineWhite = Color(0xffececec);
const Color lineGrey = Color(0xffbdbdbd);
const Color lineTextGrey = Color(0xff9E9E9E);

const Color darkModeButton = Color(0xff2F3641);
const Color lightModeButton = Color(0xff000000);
const Color darkBgCircle = Color(0xff2F3641);
const themeColor = Color.fromRGBO(78, 2, 251, 1);

width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
