import '/backend/backend.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'item_details_widget.dart' show ItemDetailsWidget;
import 'package:flutter/material.dart';

class ItemDetailsModel extends FlutterFlowModel<ItemDetailsWidget> {
  ///  Local state fields for this page.
  /// total por menu
  double? totalMenuSelected = 0.0;

  List<DocumentReference> adicionais = [];
  void addToAdicionais(DocumentReference item) => adicionais.add(item);
  void removeFromAdicionais(DocumentReference item) => adicionais.remove(item);
  void removeAtIndexFromAdicionais(int index) => adicionais.removeAt(index);
  void insertAtIndexInAdicionais(int index, DocumentReference item) =>
      adicionais.insert(index, item);
  void updateAdicionaisAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      adicionais[index] = updateFn(adicionais[index]);

  double? totalAditionalSelected = 0.0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  ItemAdditionalRecord? referenciaAdicional;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ProductCartUserRecord? productID;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navbarModel.dispose();
  }
}
