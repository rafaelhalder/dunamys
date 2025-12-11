import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GallerylocalRecord extends FirestoreRecord {
  GallerylocalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "local" field.
  DocumentReference? _local;
  DocumentReference? get local => _local;
  bool hasLocal() => _local != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _local = snapshotData['local'] as DocumentReference?;
    _video = snapshotData['video'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gallerylocal');

  static Stream<GallerylocalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GallerylocalRecord.fromSnapshot(s));

  static Future<GallerylocalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GallerylocalRecord.fromSnapshot(s));

  static GallerylocalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GallerylocalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GallerylocalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GallerylocalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GallerylocalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GallerylocalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGallerylocalRecordData({
  DocumentReference? local,
  String? video,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'local': local,
      'video': video,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class GallerylocalRecordDocumentEquality
    implements Equality<GallerylocalRecord> {
  const GallerylocalRecordDocumentEquality();

  @override
  bool equals(GallerylocalRecord? e1, GallerylocalRecord? e2) {
    return e1?.local == e2?.local &&
        e1?.video == e2?.video &&
        e1?.image == e2?.image;
  }

  @override
  int hash(GallerylocalRecord? e) =>
      const ListEquality().hash([e?.local, e?.video, e?.image]);

  @override
  bool isValidKey(Object? o) => o is GallerylocalRecord;
}
