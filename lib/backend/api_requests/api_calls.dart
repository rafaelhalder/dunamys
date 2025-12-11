import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PagamentoPixCall {
  static Future<ApiCallResponse> call({
    String? nomeCompleto = '',
    String? cpfCnpj = '',
    String? tipo = '',
    double? valor,
  }) async {
    final ffApiRequestBody = '''
{
  "MerchantOrderId": "Loja123456",
  "Customer": {
    "Name": "${escapeStringForJson(nomeCompleto)}",
    "Identity": "${escapeStringForJson(cpfCnpj)}",
    "IdentityType": "${escapeStringForJson(tipo)}"
  },
  "Payment": {
    "Type": "Pix",
    "Amount": ${valor}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pagamento Pix',
      apiUrl: 'https://apisandbox.cieloecommerce.cielo.com.br/1/sales/',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'MerchantId': '8937bd5b-9796-494d-9fe5-f76b3e4da633',
        'MerchantKey': 'XKGHUBSBKIRXKAVPSKWLVXYCLVJUGTNZLIHPUSYV',
        'accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? qrCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Payment.QrCodeString''',
      ));
  static String? pagamentoID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Payment.PaymentId''',
      ));
}

class PagamentoCartaoCall {
  static Future<ApiCallResponse> call({
    String? nomeCompleto = '',
    double? valor,
    String? expedition = '',
    String? security = '',
    String? cardNumber = '',
    String? brand = '',
    String? type = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Customer": {
    "Name": "${escapeStringForJson(nomeCompleto)}"
  },
  "Payment": {
    "Type": "${escapeStringForJson(type)}",
    "${escapeStringForJson(type)}": {
      "CardNumber": "${escapeStringForJson(cardNumber)}",
      "Holder": "${escapeStringForJson(nomeCompleto)}",
      "ExpirationDate": "${escapeStringForJson(expedition)}",
      "SecurityCode": "${escapeStringForJson(security)}",
      "SaveCard": "false",
      "Brand": "${escapeStringForJson(brand)}"
    },
    "Currency": "BRL",
    "Country": "BRA",
    "Installments": 1,
    "Capture": true,
    "Tip": false,
    "Amount": ${valor}
  },
  "MerchantOrderId": "Loja123456"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pagamento Cartao',
      apiUrl: 'https://apisandbox.cieloecommerce.cielo.com.br/1/sales/',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'MerchantId': '8937bd5b-9796-494d-9fe5-f76b3e4da633',
        'MerchantKey': 'XKGHUBSBKIRXKAVPSKWLVXYCLVJUGTNZLIHPUSYV',
        'accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? pagamentoID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Payment.PaymentId''',
      ));
  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Payment.Status''',
      ));
  static String? mensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Payment.ReturnMessage''',
      ));
  static String? errormessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].Message''',
      ));
}

class ConsultaPaymentIDCall {
  static Future<ApiCallResponse> call({
    String? paymentID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ConsultaPaymentID',
      apiUrl:
          'https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/${paymentID}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'MerchantId': '8937bd5b-9796-494d-9fe5-f76b3e4da633',
        'MerchantKey': 'XKGHUBSBKIRXKAVPSKWLVXYCLVJUGTNZLIHPUSYV',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Payment.PaymentId''',
      ));
  static int? valor(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Payment.Amount''',
      ));
  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Payment.Status''',
      ));
}

class VerifyBrandCardCall {
  static Future<ApiCallResponse> call({
    String? bin = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'verifyBrandCard',
      apiUrl:
          'https://apiquerysandbox.cieloecommerce.cielo.com.br/1/cardBin/${bin}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'MerchantId': '8937bd5b-9796-494d-9fe5-f76b3e4da633',
        'MerchantKey': 'XKGHUBSBKIRXKAVPSKWLVXYCLVJUGTNZLIHPUSYV',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? marca(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Provider''',
      ));
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
