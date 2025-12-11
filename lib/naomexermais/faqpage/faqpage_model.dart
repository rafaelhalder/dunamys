import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'faqpage_widget.dart' show FaqpageWidget;
import 'package:flutter/material.dart';

class FaqpageModel extends FlutterFlowModel<FaqpageWidget> {
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
