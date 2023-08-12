/// id : 3
/// name : "sfsafsdf"
/// image_url : "e_sheba/NQhNnVe6fkbBsSGqEtY3CcBRQIGmDXuSU8OLTNqm.png"
/// url : "www.google.com"
/// created_at : "2023-08-10T13:28:40.000000Z"
/// updated_at : "2023-08-10T13:28:40.000000Z"

class ESebahModel {
  ESebahModel({
      num? id, 
      String? name, 
      String? imageUrl, 
      String? url, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _imageUrl = imageUrl;
    _url = url;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ESebahModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _imageUrl = json['image_url'];
    _url = json['url'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _imageUrl;
  String? _url;
  String? _createdAt;
  String? _updatedAt;
ESebahModel copyWith({  num? id,
  String? name,
  String? imageUrl,
  String? url,
  String? createdAt,
  String? updatedAt,
}) => ESebahModel(  id: id ?? _id,
  name: name ?? _name,
  imageUrl: imageUrl ?? _imageUrl,
  url: url ?? _url,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get imageUrl => _imageUrl;
  String? get url => _url;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image_url'] = _imageUrl;
    map['url'] = _url;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}