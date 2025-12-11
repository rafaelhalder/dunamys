import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'order_done_widget.dart' show OrderDoneWidget;
import 'package:flutter/material.dart';

class OrderDoneModel extends FlutterFlowModel<OrderDoneWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
