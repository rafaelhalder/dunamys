// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:html' as html;
import 'package:intl/intl.dart'; // Para formatação de data

Future downloadOrdersReportCSV(List<DocumentReference> orderDocRefs) async {
  // Cabeçalho do CSV
  String fileContent = "Data Pedido,Nome Produto,Quantidade,Total Produto";

  // Formatador de data
  final DateFormat dateFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');

  for (var orderRef in orderDocRefs) {
    // Buscar o documento do pedido (OrderRecord)
    OrderRecord? orderDoc = await OrderRecord.getDocumentOnce(orderRef);

    if (orderDoc != null) {
      // Obter a data do pedido
      String orderDateStr =
          orderDoc.date != null ? dateFormatter.format(orderDoc.date!) : 'N/A';

      // Buscar os produtos associados à ordem
      List<OrderProductsRecord> orderProductsList =
          await queryOrderProductsRecordOnce(
        queryBuilder: (query) => query.where('order', isEqualTo: orderRef),
      );

      for (var orderProductDoc in orderProductsList) {
        String productName = 'Produto Desconhecido';
        String quantityStr = orderProductDoc.quantity?.toString() ?? '0';
        String productTotalStr = orderProductDoc.total != null
            ? orderProductDoc.total!.toStringAsFixed(2)
            : '0.00';

        // Buscar o documento do menu (MenuRecord)
        if (orderProductDoc.product != null) {
          MenuRecord? menuDoc =
              await MenuRecord.getDocumentOnce(orderProductDoc.product!);
          if (menuDoc != null) {
            productName = menuDoc.name ?? 'Nome Indisponível';
          }
        }

        // Adicionar linha ao CSV
        fileContent +=
            "\n$orderDateStr,\"${productName.replaceAll('"', '""')}\",$quantityStr,$productTotalStr";
      }
    }
  }

  final fileName =
      "Relatorio_Pedidos_${dateFormatter.format(DateTime.now())}.csv";
  final bytes = utf8.encode(fileContent);
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', fileName)
    ..click();
  html.Url.revokeObjectUrl(url);
}
