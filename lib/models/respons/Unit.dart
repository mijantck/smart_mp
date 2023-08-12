/// id : 1
/// name : "test"
/// created_at : "2023-08-04T21:46:01.000000Z"
/// updated_at : "2023-08-04T21:46:26.000000Z"
/// image_url : "executive_committees/lW68UQ4Ho7W91igh8RHJHf1vzEjd1VhHAok3SwCv.png"

class Unit {
  Unit({
      num? id, 
      String? name, 
      String? createdAt, 
      String? updatedAt, 
      String? imageUrl,}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _imageUrl = imageUrl;
}

  Unit.fromJson(dynamic json) {
    if (json != null) {
      _id = json['id'];
      _name = json['name'];
      _createdAt = json['created_at'];
      _updatedAt = json['updated_at'];
      _imageUrl = json['image_url'];
    }
  }
  num? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
  String? _imageUrl;
Unit copyWith({  num? id,
  String? name,
  String? createdAt,
  String? updatedAt,
  String? imageUrl,
}) => Unit(  id: id ?? _id,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  imageUrl: imageUrl ?? _imageUrl,
);
  num? get id => _id;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['image_url'] = _imageUrl;
    return map;
  }

}