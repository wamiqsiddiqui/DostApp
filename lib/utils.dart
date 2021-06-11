import 'package:flutter/cupertino.dart';

class Utils{
  static dynamic fromDateTimeToJson(DateTime date) {
    if (date == null) return null;

    return date.toUtc();
  }
}