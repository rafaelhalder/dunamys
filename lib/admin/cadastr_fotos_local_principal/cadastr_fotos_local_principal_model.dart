import '/flutter_flow/flutter_flow_util.dart';
import 'cadastr_fotos_local_principal_widget.dart'
    show CadastrFotosLocalPrincipalWidget;
import 'package:flutter/material.dart';

class CadastrFotosLocalPrincipalModel
    extends FlutterFlowModel<CadastrFotosLocalPrincipalWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData4il = false;
  FFUploadedFile uploadedLocalFile_uploadData4il =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData4il = '';

  bool isDataUploading_fileMain = false;
  FFUploadedFile uploadedLocalFile_fileMain =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_fileMain = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
