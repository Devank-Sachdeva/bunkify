// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LectureData {
  final String date;
  final bool didAttend;
  final String? notes;

  LectureData(this.date, this.didAttend, this.notes);
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'didAttend': didAttend,
      'notes': notes,
    };
  }

  factory LectureData.fromMap(Map<String, dynamic> map) {
    return LectureData(
      map['date'] as String,
      map['didAttend'] as bool,
      map['notes'] != null ? map['notes'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LectureData.fromJson(String source) => LectureData.fromMap(json.decode(source) as Map<String, dynamic>);
}
