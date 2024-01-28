import 'dart:convert';

class District {
  int? id;
  String category;

  District({this.id, this.category = ""});

  String get getCategory => category;
  set setCategory(String category) => this.category = category;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      id: map['id'] as int,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) =>
      District.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'District(id: $id, category: $category)';
}
