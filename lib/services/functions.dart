// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:livreur/constantes/error_message.dart';
import 'package:validators/validators.dart';
import 'dart:math' show cos, sqrt, asin;

bool isValidEmail(String email) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

// bool isValidName(String name) {
//   RegExp regExp = new RegExp(regexName);
//   return isAlpha(name);
// }

double getWidth(context) {
  // ignore: unnecessary_statements
  return MediaQuery.of(context).size.width;
}

double getHeigth(context) {
  // ignore: unnecessary_statements
  return MediaQuery.of(context).size.height;
}

getScreen(context) {
  // ignore: unnecessary_statements
  return MediaQuery.of(context).size;
}

String? getDateByString(String date) {
  var tab = date.split('-');
  var day = tab[2].split('T');
  return '${day[0]}-${tab[1]}-${tab[0]}';
}

String? getHourByString(String date) {
  var tab = date.split('-');
  var time = tab[2].split('T');
  var hours = time[1].split(':');
  return ' ${hours[0]} : ${hours[1]}';
}

String? maskNumber(String number) {
  return ('+221 ' ' ** *******');
}

String? maskNom() {
  return ('********');
}

String getNewDate() {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  return dateFormat.toString();
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((double.parse(lat2) - double.parse(lat1)) * p) / 2 +
      c(double.parse(lat1) * p) *
          c(double.parse(lat2) * p) *
          (1 - c((double.parse(lon2) - double.parse(lon1)) * p)) /
          2;
  return 12742 * asin(sqrt(a));
}

double VerifyDistanceLivreur(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c(((lat2) - (lat1)) * p) / 2 +
      c((lat1) * p) * c((lat2) * p) * (1 - c(((lon2) - (lon1)) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

String changeDateExpedition(String date) {
  var tab = date.split(' ');
  date = tab[0];
  return date;
}

String changeHourExpedition(TimeOfDay? hour, context) {
  var string_hour = hour!.format(context);
  var tab = string_hour.split(' ');
  return tab[0];
}

String formatDateToSend(String date, String hour) {
  return ('${date}T${hour}000Z');
}
