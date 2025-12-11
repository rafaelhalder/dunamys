import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FaqRecord extends FirestoreRecord {
  FaqRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('faq');

  static Stream<FaqRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FaqRecord.fromSnapshot(s));

  static Future<FaqRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FaqRecord.fromSnapshot(s));

  static FaqRecord fromSnapshot(DocumentSnapshot snapshot) => FaqRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FaqRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FaqRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FaqRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FaqRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFaqRecordData({
  String? title,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class FaqRecordDocumentEquality implements Equality<FaqRecord> {
  const FaqRecordDocumentEquality();

  @override
  bool equals(FaqRecord? e1, FaqRecord? e2) {
    return e1?.title == e2?.title && e1?.text == e2?.text;
  }

  @override
  int hash(FaqRecord? e) => const ListEquality().hash([e?.title, e?.text]);

  @override
  bool isValidKey(Object? o) => o is FaqRecord;
}
