import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "emotion" field.
  String? _emotion;
  String get emotion => _emotion ?? '';
  bool hasEmotion() => _emotion != null;

  // "ranking" field.
  int? _ranking;
  int get ranking => _ranking ?? 0;
  bool hasRanking() => _ranking != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "obs" field.
  String? _obs;
  String get obs => _obs ?? '';
  bool hasObs() => _obs != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _emotion = snapshotData['emotion'] as String?;
    _ranking = castToType<int>(snapshotData['ranking']);
    _date = snapshotData['date'] as DateTime?;
    _obs = snapshotData['obs'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  DocumentReference? user,
  String? emotion,
  int? ranking,
  DateTime? date,
  String? obs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'emotion': emotion,
      'ranking': ranking,
      'date': date,
      'obs': obs,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.emotion == e2?.emotion &&
        e1?.ranking == e2?.ranking &&
        e1?.date == e2?.date &&
        e1?.obs == e2?.obs;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality()
      .hash([e?.user, e?.emotion, e?.ranking, e?.date, e?.obs]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
