import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'pagamento_p_i_x_widget.dart' show PagamentoPIXWidget;
import 'package:flutter/material.dart';

class PagamentoPIXModel extends FlutterFlowModel<PagamentoPIXWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (ConsultaPaymentID)] action in pagamentoPIX widget.
  ApiCallResponse? apiResultvhq;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    navbarModel.dispose();
  }
}
