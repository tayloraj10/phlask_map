import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const appName = 'Phlask';

const primaryColor = Color.fromARGB(255, 34, 169, 225);

dateToString(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

timestampToString(Timestamp date) {
  return DateFormat('yyyy-MM-dd').format(date.toDate());
}

stringToDate(String date) {
  return DateTime.parse(date);
}

getIconType(String type) {
  switch (type) {
    case 'Public':
      return 'water_public';
    case 'Restricted':
      return 'water_restricted';
    case 'Private':
      return 'water_private';
    case 'Private-Shared':
      return 'water_shared';
    default:
      return '';
  }
}

const acceptedTapTypes = ['Public', 'Private', 'Private-Shared', 'Restricted'];
