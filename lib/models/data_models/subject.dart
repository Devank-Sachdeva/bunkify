// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// import 'package:bunkify/models/data_models/subject_type.dart';

class SubjectData {
  final String name;
  final String type;
  final String id;
  int attendedCount;
  int totalCount;

  SubjectData({
    required this.name,
    required this.type,
    required this.id,
    this.attendedCount = 0,
    this.totalCount = 0,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'id': id,
      'attendedCount': attendedCount,
      'totalCount': totalCount,
    };
  }

  factory SubjectData.fromMap(Map<String, dynamic> map) {
    return SubjectData(
      name: map['name'] as String,
      type: map['type'] as String,
      id: map['id'] as String,
      attendedCount: map['attendedCount'] as int,
      totalCount: map['totalCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectData.fromJson(String source) => SubjectData.fromMap(json.decode(source) as Map<String, dynamic>);
}
