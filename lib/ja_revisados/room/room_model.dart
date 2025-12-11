import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'room_widget.dart' show RoomWidget;
import 'package:flutter/material.dart';

class RoomModel extends FlutterFlowModel<RoomWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
