import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_user_widget.dart' show PerfilUserWidget;
import 'package:flutter/material.dart';

class PerfilUserModel extends FlutterFlowModel<PerfilUserWidget> {
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
