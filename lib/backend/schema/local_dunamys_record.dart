import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalDunamysRecord extends FirestoreRecord {
  LocalDunamysRecord._(
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
      FirebaseFirestore.instance.collection('localDunamys');

  static Stream<LocalDunamysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocalDunamysRecord.fromSnapshot(s));

  static Future<LocalDunamysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocalDunamysRecord.fromSnapshot(s));

  static LocalDunamysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocalDunamysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocalDunamysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocalDunamysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocalDunamysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocalDunamysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocalDunamysRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocalDunamysRecordDocumentEquality
    implements Equality<LocalDunamysRecord> {
  const LocalDunamysRecordDocumentEquality();

  @override
  bool equals(LocalDunamysRecord? e1, LocalDunamysRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(LocalDunamysRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is LocalDunamysRecord;
}
