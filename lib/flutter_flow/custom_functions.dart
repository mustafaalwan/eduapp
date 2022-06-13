import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String userIDGEN() {
  String _randomString = math.Random().nextInt(9999).toString() +
      math.Random().nextInt(9999).toString();
  return _randomString;
}

bool showdate(
  String date,
  DateTime datenew,
) {
  DateTime tempDate = new DateFormat("dd/MM/yyyy").parse(date);
  final datecourse = tempDate;
  final datenoew = datenew;
  final difference = datenew.difference(datecourse).inDays;

  if (difference >= 0)
    return false;
  else
    return true;
}

bool promocodeif(int coutoucary) {
  if (coutoucary == 22)
    return true;
  else if (coutoucary == 21) return false;
}
