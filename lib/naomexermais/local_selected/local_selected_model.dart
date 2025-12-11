import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'local_selected_widget.dart' show LocalSelectedWidget;
import 'package:flutter/material.dart';

class LocalSelectedModel extends FlutterFlowModel<LocalSelectedWidget> {
  ///  Local state fields for this page.

  String? imageSelected;

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
