import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cartmenucomponent_model.dart';
export 'cartmenucomponent_model.dart';

class CartmenucomponentWidget extends StatefulWidget {
  const CartmenucomponentWidget({
    super.key,
    required this.initialCounter,
    required this.productCart,
    required this.productValue,
  });

  /// contador de quantidade
  final int? initialCounter;

  final ProductCartUserRecord? productCart;
  final double? productValue;

  @override
  State<CartmenucomponentWidget> createState() =>
      _CartmenucomponentWidgetState();
}

class _CartmenucomponentWidgetState extends State<CartmenucomponentWidget> {
  late CartmenucomponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartmenucomponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: FlutterFlowCountController(
        decrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.minus,
          color: enabled
              ? FlutterFlowTheme.of(context).secondaryText
              : Color(0xFFE0E3E7),
          size: 10.0,
        ),
        incrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.plus,
          color: enabled
              ? FlutterFlowTheme.of(context).primaryText
              : Color(0xFFE0E3E7),
          size: 10.0,
        ),
        countBuilder: (count) => Text(
          count.toString(),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.poppins(
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).amarelo,
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight:
                    FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                fontStyle:
                    FlutterFlowTheme.of(context).headlineMedium.fontStyle,
              ),
        ),
        count: _model.countControllerValue ??= widget.productCart!.quantity,
        updateCount: (count) async {
          safeSetState(() => _model.countControllerValue = count);
          await widget.productCart!.reference
              .update(createProductCartUserRecordData(
            total: functions.quantityXProductValue(
                _model.countControllerValue!, widget.productValue!),
            quantity: _model.countControllerValue,
          ));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'subiu',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        },
        stepSize: 1,
      ),
    );
  }
}
