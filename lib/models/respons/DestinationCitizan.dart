
class DestinationCitizan {
  DestinationCitizan({
      int? id,
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  DestinationCitizan.fromJson(dynamic json) {
    if (json != null) {
      _id = json['id'];
      _name = json['name'];
      _createdAt = json['created_at'];
      _updatedAt = json['updated_at'];
    }
  }
  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
  DestinationCitizan copyWith({  int? id,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => DestinationCitizan(  id: id ?? _id,
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