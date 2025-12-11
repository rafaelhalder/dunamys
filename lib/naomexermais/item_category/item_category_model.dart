import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'item_category_widget.dart' show ItemCategoryWidget;
import 'package:flutter/material.dart';

class ItemCategoryModel extends FlutterFlowModel<ItemCategoryWidget> {
  ///  Local state fields for this page.
  /// total por menu
  double? totalMenuSelected = 0.0;

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
