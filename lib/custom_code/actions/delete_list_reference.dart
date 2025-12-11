// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future deleteListReference(List<DocumentReference> cartUserList) async {
  WriteBatch batch = FirebaseFirestore.instance.batch();
  for (DocumentReference docRef in cartUserList) {
    batch.delete(docRef);
  }
  await batch.commit();
}
