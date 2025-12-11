import '/components/redirect_page/redirect_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    int? pageIndex,
  }) : this.pageIndex = pageIndex ?? 1;

  final int pageIndex;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.0,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: SvgPicture.asset(
                'assets/images/navbar_4_bg_white.svg',
                width: double.infinity,
                height: 75.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              curve: Curves.easeIn,
              width: double.infinity,
              height: 72.0,
              constraints: BoxConstraints(
                minHeight: 76.0,
              ),
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          HomeWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Builder(
                        builder: (context) {
                          if (widget.pageIndex == 1) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(MenuWidget.routeName);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/login1_(2).png',
                                      width: 80.0,
                                      height: 60.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/login1_(2).png',
                                    width: 80.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          LoginWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Builder(
                        builder: (context) {
                          if (widget.pageIndex == 1) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed(CartUsersWidget.routeName);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Group_132.png',
                                      width: 80.0,
                                      height: 60.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Group_132.png',
                                    width: 80.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Spacer(flex: 3),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          LoginWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Builder(
                        builder: (context) {
                          if (widget.pageIndex == 1) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed(PerfilUserWidget.routeName);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Group_133.png',
                                      width: 80.0,
                                      height: 60.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Group_133.png',
                                    width: 80.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          LoginWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Builder(
                        builder: (context) {
                          if (widget.pageIndex == 1) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: Container(
                                              height: double.infinity,
                                              width: double.infinity,
                                              child: RedirectPageWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Group_134.png',
                                        width: 80.0,
                                        height: 60.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Group_134.png',
                                    width: 80.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 8.0))
                    .addToStart(SizedBox(width: 14.0))
                    .addToEnd(SizedBox(width: 14.0)),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.goNamed(
                  HomeWidget.routeName,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                curve: Curves.easeIn,
                width: 64.0,
                height: 64.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFD0AA5E), Color(0xFFCD9A32)],
                    stops: [0.5, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                  shape: BoxShape.circle,
                ),
                child: Builder(
                  builder: (context) {
                    if (widget.pageIndex == 3) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/95z4v_s.png',
                          width: 80.0,
                          height: 60.0,
                          fit: BoxFit.none,
                        ),
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/95z4v_s.png',
                              width: 80.0,
                              height: 60.0,
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
