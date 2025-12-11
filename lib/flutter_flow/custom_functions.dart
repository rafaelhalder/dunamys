import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';
import 'package:date_range_picker_marketplace_library_h3b4w8/flutter_flow/custom_functions.dart'
    as date_range_picker_marketplace_library_h3b4w8_functions;

double? quantityXProductValue(
  int quantidade,
  double valor,
) {
  return quantidade * valor;
}

String? creditoOrDebit(String type) {
  if (type == 'Crédito') {
    return 'CreditCard';
  } else {
    return 'DebitCard';
  }
}

String? newCustomFunction(DocumentReference idUser) {
  double totalValue = 0.0;

  // Assuming we have a Firestore collection named 'product_cart_user'
  FirebaseFirestore.instance
      .collection('product_cart_user')
      .where('user', isEqualTo: idUser)
      .get()
      .then((querySnapshot) {
    for (var doc in querySnapshot.docs) {
      int quantity = doc['quantity'];
      String menuId = doc['product'];

      // Fetch the menu item to get its value
      FirebaseFirestore.instance
          .collection('menu')
          .doc(menuId)
          .get()
          .then((menuDoc) {
        if (menuDoc.exists) {
          double value = menuDoc['value'];
          totalValue += quantityXProductValue(quantity, value) ?? 0.0;
        }
      });
    }
  });

  return totalValue.toString();
}

double? quantityXProductValueCopy2(
  int quantidade,
  double valor,
) {
  return quantidade * valor;
}

double? sumProductAditional(
  double quantidade,
  double valor,
) {
  return quantidade + valor;
}

double? quantityXProductValueAditional(
  int quantidade,
  double valor,
  double aditional,
) {
  double valueAditional = aditional * quantidade;
  return quantidade * valor + valueAditional;
}

String? convertCardBrand(String type) {
  if (type == 'MASTERCARD') {
    return 'MASTER';
  } else {
    return type;
  }
}

double? menusProductAditional(
  double quantidade,
  double valor,
) {
  return quantidade - valor;
}
