import '/components/endrawer_comp/endrawer_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_widget.dart' show MenuWidget;
import 'package:flutter/material.dart';

class MenuModel extends FlutterFlowModel<MenuWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for endrawerComp component.
  late EndrawerCompModel endrawerCompModel;

  @override
  void initState(BuildContext context) {
    endrawerCompModel = createModel(context, () => EndrawerCompModel());
  }

  @override
  void dispose() {
    endrawerCompModel.dispose();
  }
}
