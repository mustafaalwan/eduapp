import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'course_record.g.dart';

abstract class CourseRecord
    implements Built<CourseRecord, CourseRecordBuilder> {
  static Serializer<CourseRecord> get serializer => _$courseRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'course_title')
  String get courseTitle;

  @nullable
  String get courseImg;

  @nullable
  String get courseID;

  @nullable
  String get userID;

  @nullable
  @BuiltValueField(wireName: 'CourseDate')
  DateTime get courseDate;

  @nullable
  String get enddate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CourseRecordBuilder builder) => builder
    ..courseTitle = ''
    ..courseImg = ''
    ..courseID = ''
    ..userID = ''
    ..enddate = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('course');

  static Stream<CourseRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CourseRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CourseRecord._();
  factory CourseRecord([void Function(CourseRecordBuilder) updates]) =
      _$CourseRecord;

  static CourseRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCourseRecordData({
  String courseTitle,
  String courseImg,
  String courseID,
  String userID,
  DateTime courseDate,
  String enddate,
}) =>
    serializers.toFirestore(
        CourseRecord.serializer,
        CourseRecord((c) => c
          ..courseTitle = courseTitle
          ..courseImg = courseImg
          ..courseID = courseID
          ..userID = userID
          ..courseDate = courseDate
          ..enddate = enddate));
