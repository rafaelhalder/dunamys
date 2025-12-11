import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "room" field.
  int? _room;
  int get room => _room ?? 0;
  bool hasRoom() => _room != null;

  // "retirar" field.
  bool? _retirar;
  bool get retirar => _retirar ?? false;
  bool hasRetirar() => _retirar != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "payment" field.
  String? _payment;
  String get payment => _payment ?? '';
  bool hasPayment() => _payment != null;

  // "codigo" field.
  int? _codigo;
  int get codigo => _codigo ?? 0;
  bool hasCodigo() => _codigo != null;

  // "finished" field.
  bool? _finished;
  bool get finished => _finished ?? false;
  bool hasFinished() => _finished != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _room = castToType<int>(snapshotData['room']);
    _retirar = snapshotData['retirar'] as bool?;
    _total = castToType<double>(snapshotData['total']);
    _payment = snapshotData['payment'] as String?;
    _codigo = castToType<int>(snapshotData['codigo']);
    _finished = snapshotData['finished'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  DocumentReference? user,
  DateTime? date,
  String? status,
  int? room,
  bool? retirar,
  double? total,
  String? payment,
  int? codigo,
  bool? finished,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'date': date,
      'status': status,
      'room': room,
      'retirar': retirar,
      'total': total,
      'payment': payment,
      'codigo': codigo,
      'finished': finished,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.date == e2?.date &&
        e1?.status == e2?.status &&
        e1?.room == e2?.room &&
        e1?.retirar == e2?.retirar &&
        e1?.total == e2?.total &&
        e1?.payment == e2?.payment &&
        e1?.codigo == e2?.codigo &&
        e1?.finished == e2?.finished;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.user,
        e?.date,
        e?.status,
        e?.room,
        e?.retirar,
        e?.total,
        e?.payment,
        e?.codigo,
        e?.finished
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
