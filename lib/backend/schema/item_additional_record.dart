import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemAdditionalRecord extends FirestoreRecord {
  ItemAdditionalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  bool hasItem() => _item != null;

  // "name_price" field.
  String? _namePrice;
  String get namePrice => _namePrice ?? '';
  bool hasNamePrice() => _namePrice != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _item = snapshotData['item'] as DocumentReference?;
    _namePrice = snapshotData['name_price'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('item_additional');

  static Stream<ItemAdditionalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemAdditionalRecord.fromSnapshot(s));

  static Future<ItemAdditionalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemAdditionalRecord.fromSnapshot(s));

  static ItemAdditionalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItemAdditionalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemAdditionalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemAdditionalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemAdditionalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemAdditionalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemAdditionalRecordData({
  String? name,
  double? price,
  DocumentReference? item,
  String? namePrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'item': item,
      'name_price': namePrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemAdditionalRecordDocumentEquality
    implements Equality<ItemAdditionalRecord> {
  const ItemAdditionalRecordDocumentEquality();

  @override
  bool equals(ItemAdditionalRecord? e1, ItemAdditionalRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.item == e2?.item &&
        e1?.namePrice == e2?.namePrice;
  }

  @override
  int hash(ItemAdditionalRecord? e) =>
      const ListEquality().hash([e?.name, e?.price, e?.item, e?.namePrice]);

  @override
  bool isValidKey(Object? o) => o is ItemAdditionalRecord;
}
