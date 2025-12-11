import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).info,
          child: Image.asset(
            'assets/images/svg_width=162_height=162_viewBox=0_0_162_162_fill=none_xmlns=httpwww.w3.org2000svg_g_clip-path=url(#clip0_7_59)_path_d=M120.515_59.3518L120.401_59.1235C113.901_46.0357_100.978_35.9155_80.8279.png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Login': ParameterData.none(),
  'Home': ParameterData.none(),
  'cartUsers': ParameterData.none(),
  'itemDetails': (data) async => ParameterData(
        allParams: {
          'itemdetail': getParameter<DocumentReference>(data, 'itemdetail'),
          'itemvalue': getParameter<double>(data, 'itemvalue'),
        },
      ),
  'ItemCategory': (data) async => ParameterData(
        allParams: {
          'category': getParameter<DocumentReference>(data, 'category'),
        },
      ),
  'PaymentUser': ParameterData.none(),
  'room': (data) async => ParameterData(
        allParams: {
          'idOrder': getParameter<DocumentReference>(data, 'idOrder'),
        },
      ),
  'orderDone': (data) async => ParameterData(
        allParams: {
          'orderRegisterID':
              getParameter<DocumentReference>(data, 'orderRegisterID'),
        },
      ),
  'myorders': ParameterData.none(),
  'faqpage': ParameterData.none(),
  'Menu': ParameterData.none(),
  'GalleryHome': ParameterData.none(),
  'localSelected': (data) async => ParameterData(
        allParams: {
          'localID': await getDocumentParameter<LocalDunamysRecord>(
              data, 'localID', LocalDunamysRecord.fromSnapshot),
        },
      ),
  'maps': ParameterData.none(),
  'feedback': ParameterData.none(),
  'admin': ParameterData.none(),
  'cadastroProduto': ParameterData.none(),
  'registerProduct': (data) async => ParameterData(
        allParams: {
          'typeCategory': await getDocumentParameter<CategoryRecord>(
              data, 'typeCategory', CategoryRecord.fromSnapshot),
        },
      ),
  'orderClientes': ParameterData.none(),
  'detailOrder': (data) async => ParameterData(
        allParams: {
          'orderID': await getDocumentParameter<OrderRecord>(
              data, 'orderID', OrderRecord.fromSnapshot),
        },
      ),
  'feedbackClients': ParameterData.none(),
  'relatorio': ParameterData.none(),
  'perfilUser': ParameterData.none(),
  'sac': ParameterData.none(),
  'pagamentoPIX': (data) async => ParameterData(
        allParams: {
          'qrcode': getParameter<String>(data, 'qrcode'),
          'paymentID': getParameter<String>(data, 'paymentID'),
          'orderID': await getDocumentParameter<OrderRecord>(
              data, 'orderID', OrderRecord.fromSnapshot),
          'valor': getParameter<double>(data, 'valor'),
        },
      ),
  'cadastro_categoria': ParameterData.none(),
  'editar_categoria': (data) async => ParameterData(
        allParams: {
          'categoriaID': await getDocumentParameter<CategoryRecord>(
              data, 'categoriaID', CategoryRecord.fromSnapshot),
        },
      ),
  'cadastrar_categoria': ParameterData.none(),
  'faqListagem': ParameterData.none(),
  'faqEditar': (data) async => ParameterData(
        allParams: {
          'faq': await getDocumentParameter<FaqRecord>(
              data, 'faq', FaqRecord.fromSnapshot),
        },
      ),
  'faqCriar': ParameterData.none(),
  'cadastrFotosLocalPrincipal': ParameterData.none(),
  'estoqueItem': (data) async => ParameterData(
        allParams: {
          'itemDoc': await getDocumentParameter<MenuRecord>(
              data, 'itemDoc', MenuRecord.fromSnapshot),
        },
      ),
  'estoquelist': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
