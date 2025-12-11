import '/components/endrawer_comp/endrawer_comp_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'gallery_home_widget.dart' show GalleryHomeWidget;
import 'package:flutter/material.dart';

class GalleryHomeModel extends FlutterFlowModel<GalleryHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for navbar component.
  late NavbarModel navbarModel;
  // Model for endrawerComp component.
  late EndrawerCompModel endrawerCompModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
    endrawerCompModel = createModel(context, () => EndrawerCompModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
    endrawerCompModel.dispose();
  }
}
