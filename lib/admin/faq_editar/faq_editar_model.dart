import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'faq_editar_widget.dart' show FaqEditarWidget;
import 'package:flutter/material.dart';

class FaqEditarModel extends FlutterFlowModel<FaqEditarWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  // State field(s) for Texto widget.
  FocusNode? textoFocusNode;
  TextEditingController? textoTextController;
  String? Function(BuildContext, String?)? textoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    textoFocusNode?.dispose();
    textoTextController?.dispose();
  }
}
