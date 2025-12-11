import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderProductsRecord extends FirestoreRecord {
  OrderProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "order" field.
  DocumentReference? _order;
  DocumentReference? get order => _order;
  bool hasOrder() => _order != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "obs" field.
  String? _obs;
  String get obs => _obs ?? '';
  bool hasObs() => _obs != null;

  // "additional" field.
  List<DocumentReference>? _additional;
  List<DocumentReference> get additional => _additional ?? const [];
  bool hasAdditional() => _additional != null;

  void _initializeFields() {
    _order = snapshotData['order'] as DocumentReference?;
    _product = snapshotData['product'] as DocumentReference?;
    _total = castToType<double>(snapshotData['total']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _obs = snapshotData['obs'] as String?;
    _additional = getDataList(snapshotData['additional']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_products');

  static Stream<OrderProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderProductsRecord.fromSnapshot(s));

  static Future<OrderProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderProductsRecord.fromSnapshot(s));

  static OrderProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderProductsRecordData({
  DocumentReference? order,
  DocumentReference? product,
  double? total,
  int? quantity,
  String? obs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order': order,
      'product': product,
      'total': total,
      'quantity': quantity,
      'obs': obs,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderProductsRecordDocumentEquality
    implements Equality<OrderProductsRecord> {
  const OrderProductsRecordDocumentEquality();

  @override
  bool equals(OrderProductsRecord? e1, OrderProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.order == e2?.order &&
        e1?.product == e2?.product &&
        e1?.total == e2?.total &&
        e1?.quantity == e2?.quantity &&
        e1?.obs == e2?.obs &&
        listEquality.equals(e1?.additional, e2?.additional);
  }

  @override
  int hash(OrderProductsRecord? e) => const ListEquality().hash(
      [e?.order, e?.product, e?.total, e?.quantity, e?.obs, e?.additional]);

  @override
  bool isValidKey(Object? o) => o is OrderProductsRecord;
}
