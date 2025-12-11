import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GalleryMainRecord extends FirestoreRecord {
  GalleryMainRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gallery_main');

  static Stream<GalleryMainRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GalleryMainRecord.fromSnapshot(s));

  static Future<GalleryMainRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GalleryMainRecord.fromSnapshot(s));

  static GalleryMainRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GalleryMainRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GalleryMainRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GalleryMainRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GalleryMainRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GalleryMainRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGalleryMainRecordData({
  String? image,
  String? video,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'video': video,
    }.withoutNulls,
  );

  return firestoreData;
}

class GalleryMainRecordDocumentEquality implements Equality<GalleryMainRecord> {
  const GalleryMainRecordDocumentEquality();

  @override
  bool equals(GalleryMainRecord? e1, GalleryMainRecord? e2) {
    return e1?.image == e2?.image && e1?.video == e2?.video;
  }

  @override
  int hash(GalleryMainRecord? e) =>
      const ListEquality().hash([e?.image, e?.video]);

  @override
  bool isValidKey(Object? o) => o is GalleryMainRecord;
}
