import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'relatorio_widget.dart' show RelatorioWidget;
import 'package:flutter/material.dart';

class RelatorioModel extends FlutterFlowModel<RelatorioWidget> {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<OrderRecord>? filterOrders;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
