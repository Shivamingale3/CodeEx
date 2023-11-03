import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VersionsRecord extends FirestoreRecord {
  VersionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "version" field.
  double? _version;
  double get version => _version ?? 0.0;
  bool hasVersion() => _version != null;

  // "changelog" field.
  String? _changelog;
  String get changelog => _changelog ?? '';
  bool hasChangelog() => _changelog != null;

  void _initializeFields() {
    _version = castToType<double>(snapshotData['version']);
    _changelog = snapshotData['changelog'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('versions');

  static Stream<VersionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VersionsRecord.fromSnapshot(s));

  static Future<VersionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VersionsRecord.fromSnapshot(s));

  static VersionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VersionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VersionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VersionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VersionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VersionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVersionsRecordData({
  double? version,
  String? changelog,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'version': version,
      'changelog': changelog,
    }.withoutNulls,
  );

  return firestoreData;
}

class VersionsRecordDocumentEquality implements Equality<VersionsRecord> {
  const VersionsRecordDocumentEquality();

  @override
  bool equals(VersionsRecord? e1, VersionsRecord? e2) {
    return e1?.version == e2?.version && e1?.changelog == e2?.changelog;
  }

  @override
  int hash(VersionsRecord? e) =>
      const ListEquality().hash([e?.version, e?.changelog]);

  @override
  bool isValidKey(Object? o) => o is VersionsRecord;
}
