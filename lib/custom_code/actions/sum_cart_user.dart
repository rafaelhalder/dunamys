// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> sumCartUser(List<DocumentReference> cartUserList) async {
  double totalSum = 0.0;

  if (cartUserList == null || cartUserList.isEmpty) {
    return totalSum;
  }

  for (DocumentReference docRef in cartUserList) {
    try {
      DocumentSnapshot documentSnapshot = await docRef.get();
      if (documentSnapshot.exists) {
        // Tenta buscar o campo 'total'.
        // O 'data()' pode retornar null, então usamos '?'
        // O campo 'total' pode não existir, ou ser de outro tipo.
        final data = documentSnapshot.data() as Map<String, dynamic>?;
        if (data != null && data.containsKey('total')) {
          dynamic totalValue = data['total'];
          if (totalValue != null && totalValue is num) {
            totalSum += (totalValue as num).toDouble();
          } else {
            // Opcional: Logar se o campo 'total' não for um número ou for nulo
            print(
                'Document ${docRef.id} has a non-numeric or null total value.');
          }
        } else {
          // Opcional: Logar se o campo 'total' não existir no documento
          print('Document ${docRef.id} does not contain a total field.');
        }
      } else {
        // Opcional: Logar se um documento referenciado não existir
        print('Document ${docRef.id} does not exist.');
      }
    } catch (e) {
      // Opcional: Logar qualquer erro durante o processo de busca do documento
      print('Error fetching document ${docRef.id}: $e');
    }
  }

  return totalSum;
}
