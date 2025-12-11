import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _somaCarrinho =
          await secureStorage.getDouble('ff_somaCarrinho') ?? _somaCarrinho;
    });
    await _safeInitAsync(() async {
      _cartUser = (await secureStorage.getStringList('ff_cartUser'))
              ?.map((path) => path.ref)
              .toList() ??
          _cartUser;
    });
    await _safeInitAsync(() async {
      _adicionalProduct =
          (await secureStorage.getStringList('ff_adicionalProduct'))
                  ?.map((path) => path.ref)
                  .toList() ??
              _adicionalProduct;
    });
    await _safeInitAsync(() async {
      _adicionalPerProduct =
          await secureStorage.getStringList('ff_adicionalPerProduct') ??
              _adicionalPerProduct;
    });
    await _safeInitAsync(() async {
      _timerOrder =
          await secureStorage.getString('ff_timerOrder') ?? _timerOrder;
    });
    await _safeInitAsync(() async {
      _confirmRoom =
          await secureStorage.getBool('ff_confirmRoom') ?? _confirmRoom;
    });
    await _safeInitAsync(() async {
      _orderId = (await secureStorage.getString('ff_orderId'))?.ref ?? _orderId;
    });
    await _safeInitAsync(() async {
      _pixString = await secureStorage.getString('ff_pixString') ?? _pixString;
    });
    await _safeInitAsync(() async {
      _pedidoEmAndamento =
          await secureStorage.getBool('ff_pedidoEmAndamento') ??
              _pedidoEmAndamento;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  double _somaCarrinho = 0.0;
  double get somaCarrinho => _somaCarrinho;
  set somaCarrinho(double value) {
    _somaCarrinho = value;
    secureStorage.setDouble('ff_somaCarrinho', value);
  }

  void deleteSomaCarrinho() {
    secureStorage.delete(key: 'ff_somaCarrinho');
  }

  List<DocumentReference> _cartUser = [];
  List<DocumentReference> get cartUser => _cartUser;
  set cartUser(List<DocumentReference> value) {
    _cartUser = value;
    secureStorage.setStringList(
        'ff_cartUser', value.map((x) => x.path).toList());
  }

  void deleteCartUser() {
    secureStorage.delete(key: 'ff_cartUser');
  }

  void addToCartUser(DocumentReference value) {
    cartUser.add(value);
    secureStorage.setStringList(
        'ff_cartUser', _cartUser.map((x) => x.path).toList());
  }

  void removeFromCartUser(DocumentReference value) {
    cartUser.remove(value);
    secureStorage.setStringList(
        'ff_cartUser', _cartUser.map((x) => x.path).toList());
  }

  void removeAtIndexFromCartUser(int index) {
    cartUser.removeAt(index);
    secureStorage.setStringList(
        'ff_cartUser', _cartUser.map((x) => x.path).toList());
  }

  void updateCartUserAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    cartUser[index] = updateFn(_cartUser[index]);
    secureStorage.setStringList(
        'ff_cartUser', _cartUser.map((x) => x.path).toList());
  }

  void insertAtIndexInCartUser(int index, DocumentReference value) {
    cartUser.insert(index, value);
    secureStorage.setStringList(
        'ff_cartUser', _cartUser.map((x) => x.path).toList());
  }

  List<DocumentReference> _adicionalProduct = [];
  List<DocumentReference> get adicionalProduct => _adicionalProduct;
  set adicionalProduct(List<DocumentReference> value) {
    _adicionalProduct = value;
    secureStorage.setStringList(
        'ff_adicionalProduct', value.map((x) => x.path).toList());
  }

  void deleteAdicionalProduct() {
    secureStorage.delete(key: 'ff_adicionalProduct');
  }

  void addToAdicionalProduct(DocumentReference value) {
    adicionalProduct.add(value);
    secureStorage.setStringList(
        'ff_adicionalProduct', _adicionalProduct.map((x) => x.path).toList());
  }

  void removeFromAdicionalProduct(DocumentReference value) {
    adicionalProduct.remove(value);
    secureStorage.setStringList(
        'ff_adicionalProduct', _adicionalProduct.map((x) => x.path).toList());
  }

  void removeAtIndexFromAdicionalProduct(int index) {
    adicionalProduct.removeAt(index);
    secureStorage.setStringList(
        'ff_adicionalProduct', _adicionalProduct.map((x) => x.path).toList());
  }

  void updateAdicionalProductAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    adicionalProduct[index] = updateFn(_adicionalProduct[index]);
    secureStorage.setStringList(
        'ff_adicionalProduct', _adicionalProduct.map((x) => x.path).toList());
  }

  void insertAtIndexInAdicionalProduct(int index, DocumentReference value) {
    adicionalProduct.insert(index, value);
    secureStorage.setStringList(
        'ff_adicionalProduct', _adicionalProduct.map((x) => x.path).toList());
  }

  List<String> _adicionalPerProduct = [];
  List<String> get adicionalPerProduct => _adicionalPerProduct;
  set adicionalPerProduct(List<String> value) {
    _adicionalPerProduct = value;
    secureStorage.setStringList('ff_adicionalPerProduct', value);
  }

  void deleteAdicionalPerProduct() {
    secureStorage.delete(key: 'ff_adicionalPerProduct');
  }

  void addToAdicionalPerProduct(String value) {
    adicionalPerProduct.add(value);
    secureStorage.setStringList('ff_adicionalPerProduct', _adicionalPerProduct);
  }

  void removeFromAdicionalPerProduct(String value) {
    adicionalPerProduct.remove(value);
    secureStorage.setStringList('ff_adicionalPerProduct', _adicionalPerProduct);
  }

  void removeAtIndexFromAdicionalPerProduct(int index) {
    adicionalPerProduct.removeAt(index);
    secureStorage.setStringList('ff_adicionalPerProduct', _adicionalPerProduct);
  }

  void updateAdicionalPerProductAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    adicionalPerProduct[index] = updateFn(_adicionalPerProduct[index]);
    secureStorage.setStringList('ff_adicionalPerProduct', _adicionalPerProduct);
  }

  void insertAtIndexInAdicionalPerProduct(int index, String value) {
    adicionalPerProduct.insert(index, value);
    secureStorage.setStringList('ff_adicionalPerProduct', _adicionalPerProduct);
  }

  String _timerOrder = '';
  String get timerOrder => _timerOrder;
  set timerOrder(String value) {
    _timerOrder = value;
    secureStorage.setString('ff_timerOrder', value);
  }

  void deleteTimerOrder() {
    secureStorage.delete(key: 'ff_timerOrder');
  }

  bool _confirmRoom = false;
  bool get confirmRoom => _confirmRoom;
  set confirmRoom(bool value) {
    _confirmRoom = value;
    secureStorage.setBool('ff_confirmRoom', value);
  }

  void deleteConfirmRoom() {
    secureStorage.delete(key: 'ff_confirmRoom');
  }

  DocumentReference? _orderId;
  DocumentReference? get orderId => _orderId;
  set orderId(DocumentReference? value) {
    _orderId = value;
    value != null
        ? secureStorage.setString('ff_orderId', value.path)
        : secureStorage.remove('ff_orderId');
  }

  void deleteOrderId() {
    secureStorage.delete(key: 'ff_orderId');
  }

  String _pixString = '';
  String get pixString => _pixString;
  set pixString(String value) {
    _pixString = value;
    secureStorage.setString('ff_pixString', value);
  }

  void deletePixString() {
    secureStorage.delete(key: 'ff_pixString');
  }

  bool _pedidoEmAndamento = false;
  bool get pedidoEmAndamento => _pedidoEmAndamento;
  set pedidoEmAndamento(bool value) {
    _pedidoEmAndamento = value;
    secureStorage.setBool('ff_pedidoEmAndamento', value);
  }

  void deletePedidoEmAndamento() {
    secureStorage.delete(key: 'ff_pedidoEmAndamento');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
