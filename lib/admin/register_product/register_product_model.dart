import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'register_product_widget.dart' show RegisterProductWidget;
import 'package:flutter/material.dart';

class RegisterProductModel extends FlutterFlowModel<RegisterProductWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_updateImageProduct2 = false;
  FFUploadedFile uploadedLocalFile_updateImageProduct2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_updateImageProduct2 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for Add1 widget.
  FocusNode? add1FocusNode;
  TextEditingController? add1TextController;
  String? Function(BuildContext, String?)? add1TextControllerValidator;
  // State field(s) for Val1 widget.
  FocusNode? val1FocusNode;
  TextEditingController? val1TextController;
  String? Function(BuildContext, String?)? val1TextControllerValidator;
  // State field(s) for Add2 widget.
  FocusNode? add2FocusNode;
  TextEditingController? add2TextController;
  String? Function(BuildContext, String?)? add2TextControllerValidator;
  // State field(s) for Val2 widget.
  FocusNode? val2FocusNode;
  TextEditingController? val2TextController;
  String? Function(BuildContext, String?)? val2TextControllerValidator;
  // State field(s) for Add3 widget.
  FocusNode? add3FocusNode;
  TextEditingController? add3TextController;
  String? Function(BuildContext, String?)? add3TextControllerValidator;
  // State field(s) for Val3 widget.
  FocusNode? val3FocusNode;
  TextEditingController? val3TextController;
  String? Function(BuildContext, String?)? val3TextControllerValidator;
  // State field(s) for Add4 widget.
  FocusNode? add4FocusNode;
  TextEditingController? add4TextController;
  String? Function(BuildContext, String?)? add4TextControllerValidator;
  // State field(s) for Val4 widget.
  FocusNode? val4FocusNode;
  TextEditingController? val4TextController;
  String? Function(BuildContext, String?)? val4TextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MenuRecord? idProduct;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    add1FocusNode?.dispose();
    add1TextController?.dispose();

    val1FocusNode?.dispose();
    val1TextController?.dispose();

    add2FocusNode?.dispose();
    add2TextController?.dispose();

    val2FocusNode?.dispose();
    val2TextController?.dispose();

    add3FocusNode?.dispose();
    add3TextController?.dispose();

    val3FocusNode?.dispose();
    val3TextController?.dispose();

    add4FocusNode?.dispose();
    add4TextController?.dispose();

    val4FocusNode?.dispose();
    val4TextController?.dispose();
  }
}
