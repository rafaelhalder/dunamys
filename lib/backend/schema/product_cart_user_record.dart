import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductCartUserRecord extends FirestoreRecord {
  ProductCartUserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

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

  // "productAditional" field.
  double? _productAditional;
  double get productAditional => _productAditional ?? 0.0;
  bool hasProductAditional() => _productAditional != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _product = snapshotData['product'] as DocumentReference?;
    _total = castToType<double>(snapshotData['total']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _obs = snapshotData['obs'] as String?;
    _additional = getDataList(snapshotData['additional']);
    _productAditional = castToType<double>(snapshotData['productAditional']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product_cart_user');

  static Stream<ProductCartUserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductCartUserRecord.fromSnapshot(s));

  static Future<ProductCartUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductCartUserRecord.fromSnapshot(s));

  static ProductCartUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductCartUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductCartUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductCartUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductCartUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductCartUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductCartUserRecordData({
  DocumentReference? user,
  DocumentReference? product,
  double? total,
  int? quantity,
  String? obs,
  double? productAditional,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'product': product,
      'total': total,
      'quantity': quantity,
      'obs': obs,
      'productAditional': productAditional,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductCartUserRecordDocumentEquality
    implements Equality<ProductCartUserRecord> {
  const ProductCartUserRecordDocumentEquality();

  @override
  bool equals(ProductCartUserRecord? e1, ProductCartUserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.product == e2?.product &&
        e1?.total == e2?.total &&
        e1?.quantity == e2?.quantity &&
        e1?.obs == e2?.obs &&
        listEquality.equals(e1?.additional, e2?.additional) &&
        e1?.productAditional == e2?.productAditional;
  }

  @override
  int hash(ProductCartUserRecord? e) => const ListEquality().hash([
        e?.user,
        e?.product,
        e?.total,
        e?.quantity,
        e?.obs,
        e?.additional,
        e?.productAditional
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductCartUserRecord;
}
