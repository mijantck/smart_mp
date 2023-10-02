
class SocialLinkModel {
  SocialLinkModel({
      int? id,
      String? name, 
      String? imageUrl, 
      String? value,
      String? type,
      String? phone,
      String? createdAt,
      String? updatedAt,}){
    _id = id;
    _name = name;
    _imageUrl = imageUrl;
    _type = type;
    _phone = phone;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  SocialLinkModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _imageUrl = json['image_url'];
    _value = json['value'];
    _type = json['type'];
    _phone = json['phone'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _imageUrl;
  String? _value;
  String? _type;
  String? _phone;
  String? _createdAt;
  String? _updatedAt;
SocialLinkModel copyWith({  int? id,
  String? name,
  String? imageUrl,
  String? value,
  String? type,
  String? phone,
  String? createdAt,
  String? updatedAt,
}) => SocialLinkModel(  id: id ?? _id,
  name: name ?? _name,
  imageUrl: imageUrl ?? _imageUrl,
  value: value ?? _value,
  type: type ?? _type,
  phone: phone ?? _phone,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get name => _name;
  String? get imageUrl => _imageUrl;
  String? get value => _value;
  String? get type => _type;
  String? get phone => _phone;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image_url'] = _imageUrl;
    map['value'] = _value;
    map['type'] = _type;
    map['phone'] = _phone;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}