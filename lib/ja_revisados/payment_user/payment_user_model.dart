import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'payment_user_widget.dart' show PaymentUserWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PaymentUserModel extends FlutterFlowModel<PaymentUserWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  late MaskTextInputFormatter cpfMask;
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController3;
  late MaskTextInputFormatter textFieldMask1;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController4;
  late MaskTextInputFormatter textFieldMask2;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController7;
  late MaskTextInputFormatter textFieldMask5;
  String? Function(BuildContext, String?)? textController7Validator;
  // Stores action output result for [Backend Call - API (Pagamento Pix)] action in Container widget.
  ApiCallResponse? pixID;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  OrderRecord? orderIDPay;
  // Stores action output result for [Backend Call - API (verifyBrandCard)] action in Container widget.
  ApiCallResponse? verificarMarca;
  // Stores action output result for [Backend Call - API (Pagamento Cartao)] action in Container widget.
  ApiCallResponse? fazerPagamento;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  OrderRecord? orderIDPayCard;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  MenuRecord? produtoIt;
  // Stores action output result for [Custom Action - menusQuantity] action in Container widget.
  int? nemTOtal;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController3?.dispose();

    textFieldFocusNode2?.dispose();
    textController4?.dispose();

    textFieldFocusNode3?.dispose();
    textController5?.dispose();

    textFieldFocusNode4?.dispose();
    textController6?.dispose();

    textFieldFocusNode5?.dispose();
    textController7?.dispose();

    navbarModel.dispose();
  }
}
