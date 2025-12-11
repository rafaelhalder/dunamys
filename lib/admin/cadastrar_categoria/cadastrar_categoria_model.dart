import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadastrar_categoria_widget.dart' show CadastrarCategoriaWidget;
import 'package:flutter/material.dart';

class CadastrarCategoriaModel
    extends FlutterFlowModel<CadastrarCategoriaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
