import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const appName = 'Phlask';

const primaryColor = Color.fromARGB(255, 46, 148, 216);

dateToString(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

timestampToString(Timestamp date) {
  return DateFormat('yyyy-MM-dd').format(date.toDate());
}

stringToDate(String date) {
  return DateTime.parse(date);
}
