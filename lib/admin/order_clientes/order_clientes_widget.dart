import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'order_clientes_model.dart';
export 'order_clientes_model.dart';

class OrderClientesWidget extends StatefulWidget {
  const OrderClientesWidget({super.key});

  static String routeName = 'orderClientes';
  static String routePath = '/orderClientes';

  @override
  State<OrderClientesWidget> createState() => _OrderClientesWidgetState();
}

class _OrderClientesWidgetState extends State<OrderClientesWidget> {
  late OrderClientesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderClientesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.065),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 65.0,
              icon: Icon(
                Icons.arrow_circle_left_sharp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 35.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Page Title',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.poppins(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Pedidos',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  StreamBuilder<List<OrderRecord>>(
                    stream: queryOrderRecord(
                      queryBuilder: (orderRecord) => orderRecord.where(
                        'finished',
                        isEqualTo: false,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ),
                        );
                      }
                      List<OrderRecord> columnOrderRecordList = snapshot.data!;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(columnOrderRecordList.length,
                            (columnIndex) {
                          final columnOrderRecord =
                              columnOrderRecordList[columnIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  DetailOrderWidget.routeName,
                                  queryParameters: {
                                    'orderID': serializeParam(
                                      columnOrderRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'orderID': columnOrderRecord,
                                  },
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            columnOrderRecord.room.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 18.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    StreamBuilder<List<OrderProductsRecord>>(
                                      stream: queryOrderProductsRecord(
                                        queryBuilder: (orderProductsRecord) =>
                                            orderProductsRecord.where(
                                          'order',
                                          isEqualTo:
                                              columnOrderRecord.reference,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrderProductsRecord>
                                            columnOrderProductsRecordList =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnOrderProductsRecordList
                                                  .length, (columnIndex) {
                                            final columnOrderProductsRecord =
                                                columnOrderProductsRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 10.0, 20.0, 0.0),
                                              child: StreamBuilder<MenuRecord>(
                                                stream: MenuRecord.getDocument(
                                                    columnOrderProductsRecord
                                                        .product!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final rowMenuRecord =
                                                      snapshot.data!;

                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidCircle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 7.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Text(
                                                          columnOrderProductsRecord
                                                              .quantity
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        rowMenuRecord.name,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              columnOrderRecord.status,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          if (columnOrderRecord.status ==
                                              'Pagamento Finalizado')
                                            FaIcon(
                                              FontAwesomeIcons.dotCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              size: 22.0,
                                            ),
                                          if (columnOrderRecord.status ==
                                              'Pagamento Cancelado')
                                            FaIcon(
                                              FontAwesomeIcons.dotCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor1,
                                              size: 22.0,
                                            ),
                                          if (columnOrderRecord.status ==
                                              'Aguardando Pagamento')
                                            FaIcon(
                                              FontAwesomeIcons.dotCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              size: 22.0,
                                            ),
                                          if (columnOrderRecord.status ==
                                              'Em Produção')
                                            FaIcon(
                                              FontAwesomeIcons.dotCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              size: 22.0,
                                            ),
                                          if (columnOrderRecord.status ==
                                              'Saiu para Entrega')
                                            FaIcon(
                                              FontAwesomeIcons.dotCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              size: 22.0,
                                            ),
                                          if (columnOrderRecord.status ==
                                              'Disponivel para retirar')
                                            FaIcon(
                                              FontAwesomeIcons.dotCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              size: 22.0,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
