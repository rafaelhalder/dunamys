// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> dateTimeOrder(DocumentReference orderDocRef) async {
  // Add your function code here!
  DocumentSnapshot documentSnapshot = await orderDocRef.get();

  if (documentSnapshot.exists) {
    // Pegando os dados do documento
    Map<String, dynamic>? data =
        documentSnapshot.data() as Map<String, dynamic>?;

    // Verificando se o campo 'datetime' existe e é do tipo Timestamp
    if (data != null && data.containsKey('date') && data['date'] is Timestamp) {
      Timestamp orderTime = data['date'] as Timestamp;
      DateTime orderDateTime = orderTime.toDate();

      // Obtendo a data e hora atual
      DateTime now = DateTime.now();

      // Calculando a diferença
      Duration difference = now.difference(orderDateTime);

      // Formatando a diferença em hh:mm
      // Exemplo: se a diferença for 1 hora e 25 minutos, o resultado será "01:25"
      // Exemplo: se a diferença for 0 horas e 5 minutos, o resultado será "00:05"
      String formattedDifference =
          '${difference.inHours.toString().padLeft(2, '0')}:${(difference.inMinutes % 60).toString().padLeft(2, '0')}';

      return formattedDifference;
    } else {
      // Retorna uma mensagem se o campo 'datetime' não for encontrado ou for inválido no documento
      return 'Campo datetime ausente/inválido no pedido';
    }
  } else {
    // Retorna uma mensagem se o documento referenciado não for encontrado
    return 'Documento do pedido não encontrado';
  }
}
