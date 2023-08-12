
class DestinationParty {
  DestinationParty({
      int? id,
      String? name, 
      int? priority,
      String? createdAt,
      String? updatedAt,}){
    _id = id;
    _name = name;
    _priority = priority;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  DestinationParty.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _priority = json['priority'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  int? _priority;
  String? _createdAt;
  String? _updatedAt;
DestinationParty copyWith({  int? id,
  String? name,
  int? priority,
  String? createdAt,
  String? updatedAt,
}) => DestinationParty(
  id: id ?? _id,
  name: name ?? _name,
  priority: priority ?? _priority,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get name => _name;
  int? get priority => _priority;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['priority'] = _priority;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}