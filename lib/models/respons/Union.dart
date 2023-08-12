/// id : 1
/// name : "test"
/// created_at : "2023-08-04T21:45:54.000000Z"
/// updated_at : "2023-08-04T21:45:54.000000Z"

class Union {
  Union({
      int? id,
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Union.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
  Union copyWith({  int? id,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => Union(  id: id ?? _id,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}