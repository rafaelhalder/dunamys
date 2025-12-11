import '/backend/backend.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'myorders_widget.dart' show MyordersWidget;
import 'package:flutter/material.dart';

class MyordersModel extends FlutterFlowModel<MyordersWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Firestore Query - Query a collection] action in myorders widget.
  OrderRecord? lastOrder;
  // Stores action output result for [Custom Action - dateTimeOrder] action in myorders widget.
  String? timer;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    navbarModel.dispose();
  }
}
