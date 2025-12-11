import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_cart_user_model.dart';
export 'component_cart_user_model.dart';

class ComponentCartUserWidget extends StatefulWidget {
  const ComponentCartUserWidget({
    super.key,
    this.idProduct,
    required this.productValue,
    required this.initialCounter,
  });

  final DocumentReference? idProduct;
  final double? productValue;
  final int? initialCounter;

  @override
  State<ComponentCartUserWidget> createState() =>
      _ComponentCartUserWidgetState();
}

class _ComponentCartUserWidgetState extends State<ComponentCartUserWidget> {
  late ComponentCartUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentCartUserModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 94.0,
          height: 52.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).bordaCinza,
              width: 1.0,
            ),
          ),
          child: FlutterFlowCountController(
            decrementIconBuilder: (enabled) => Icon(
              Icons.remove_rounded,
              color: enabled
                  ? FlutterFlowTheme.of(context).secondaryText
                  : FlutterFlowTheme.of(context).alternate,
              size: 16.0,
            ),
            incrementIconBuilder: (enabled) => Icon(
              Icons.add_rounded,
              color: enabled
                  ? FlutterFlowTheme.of(context).primaryText
                  : FlutterFlowTheme.of(context).alternate,
              size: 16.0,
            ),
            countBuilder: (count) => Text(
              count.toString(),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.poppins(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).amarelo,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
            count: _model.countControllerValue ??= widget.initialCounter!,
            updateCount: (count) async {
              safeSetState(() => _model.countControllerValue = count);
              if (_model.countControllerValue == 0) {
                await widget.idProduct!.delete();
                FFAppState().removeFromCartUser(widget.idProduct!);
                FFAppState().update(() {});
              } else {
                await widget.idProduct!.update(createProductCartUserRecordData(
                  total: functions.quantityXProductValue(
                      _model.countControllerValue!, widget.productValue!),
                  quantity: _model.countControllerValue,
                ));
                _model.atualCounter = _model.countControllerValue;
                safeSetState(() {});
              }

              _model.newSum = await actions.sumCartUser(
                FFAppState().cartUser.toList(),
              );
              FFAppState().somaCarrinho = _model.newSum!;
              FFAppState().update(() {});

              safeSetState(() {});
            },
            stepSize: 1,
            minimum: 0,
            contentPadding:
                EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          ),
        ),
      ],
    );
  }
}
