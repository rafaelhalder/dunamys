import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'maps_widget.dart' show MapsWidget;
import 'package:flutter/material.dart';

class MapsModel extends FlutterFlowModel<MapsWidget> {
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
