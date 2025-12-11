import '/backend/backend.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'local_selected_model.dart';
export 'local_selected_model.dart';

class LocalSelectedWidget extends StatefulWidget {
  const LocalSelectedWidget({
    super.key,
    required this.localID,
  });

  final LocalDunamysRecord? localID;

  static String routeName = 'localSelected';
  static String routePath = '/localSelected';

  @override
  State<LocalSelectedWidget> createState() => _LocalSelectedWidgetState();
}

class _LocalSelectedWidgetState extends State<LocalSelectedWidget> {
  late LocalSelectedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocalSelectedModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LocalDunamysRecord>(
      stream: LocalDunamysRecord.getDocument(widget.localID!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              ),
            ),
          );
        }

        final localSelectedLocalDunamysRecord = snapshot.data!;

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
                    color: Color(0xFFD0AA5E),
                    size: 35.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                actions: [],
                elevation: 0.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 20.0),
                            child: Text(
                              localSelectedLocalDunamysRecord.name,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        StreamBuilder<List<GallerylocalRecord>>(
                          stream: queryGallerylocalRecord(
                            queryBuilder: (gallerylocalRecord) =>
                                gallerylocalRecord.where(
                              'local',
                              isEqualTo: widget.localID?.reference,
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<GallerylocalRecord>
                                imagePrincipalGallerylocalRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final imagePrincipalGallerylocalRecord =
                                imagePrincipalGallerylocalRecordList.isNotEmpty
                                    ? imagePrincipalGallerylocalRecordList.first
                                    : null;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FlutterFlowExpandedImageView(
                                      image: Image.network(
                                        valueOrDefault<String>(
                                          _model.imageSelected,
                                          'https://dunamyshotel.com.br/wp-content/uploads/2023/10/panoramica-apartamento-master.jpg',
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                      allowRotation: false,
                                      tag: valueOrDefault<String>(
                                        _model.imageSelected,
                                        'https://dunamyshotel.com.br/wp-content/uploads/2023/10/panoramica-apartamento-master.jpg',
                                      ),
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: valueOrDefault<String>(
                                  _model.imageSelected,
                                  'https://dunamyshotel.com.br/wp-content/uploads/2023/10/panoramica-apartamento-master.jpg',
                                ),
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      _model.imageSelected,
                                      'https://dunamyshotel.com.br/wp-content/uploads/2023/10/panoramica-apartamento-master.jpg',
                                    ),
                                    width: double.infinity,
                                    height: 400.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: StreamBuilder<List<GallerylocalRecord>>(
                              stream: queryGallerylocalRecord(
                                queryBuilder: (gallerylocalRecord) =>
                                    gallerylocalRecord.where(
                                  'local',
                                  isEqualTo: widget.localID?.reference,
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
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<GallerylocalRecord>
                                    rowGallerylocalRecordList = snapshot.data!;

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        rowGallerylocalRecordList.length,
                                        (rowIndex) {
                                      final rowGallerylocalRecord =
                                          rowGallerylocalRecordList[rowIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.imageSelected =
                                              rowGallerylocalRecord.image;
                                          safeSetState(() {});
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            rowGallerylocalRecord.image,
                                            width: 126.0,
                                            height: 126.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }).divide(SizedBox(width: 10.0)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navbarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
