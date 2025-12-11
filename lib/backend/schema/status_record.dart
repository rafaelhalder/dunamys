import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatusRecord extends FirestoreRecord {
  StatusRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('status');

  static Stream<StatusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatusRecord.fromSnapshot(s));

  static Future<StatusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatusRecord.fromSnapshot(s));

  static StatusRecord fromSnapshot(DocumentSnapshot snapshot) => StatusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatusRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatusRecordDocumentEquality implements Equality<StatusRecord> {
  const StatusRecordDocumentEquality();

  @override
  bool equals(StatusRecord? e1, StatusRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(StatusRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is StatusRecord;
}
