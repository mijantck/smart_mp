/// id : 1
/// name : "Bagmara"
/// created_at : "2023-08-05T23:06:20.000000Z"
/// updated_at : "-000001-11-30T00:00:00.000000Z"

class Upazila {
  Upazila({
      int? id,
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Upazila.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
Upazila copyWith({  int? id,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => Upazila(
  id: id ?? _id,
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