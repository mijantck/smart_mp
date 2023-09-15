/// id : 1
/// title : "sdsadas"
/// image_url : "bagmara_about_images/x1ii4qMtTdvTmn3LhQhDqbm7sZjQC0JY7vU9FF0b.png"
/// details : "asdasdasdada"
/// created_at : "2023-09-06T10:37:07.000000Z"
/// updated_at : "2023-09-06T10:37:07.000000Z"


//bagmara_about

class BagmaraAboutModel {
  BagmaraAboutModel({
      num? id, 
      String? title, 
      String? imageUrl, 
      String? details, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _imageUrl = imageUrl;
    _details = details;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  BagmaraAboutModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _imageUrl = json['image_url'];
    _details = json['details'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _imageUrl;
  String? _details;
  String? _createdAt;
  String? _updatedAt;
BagmaraAboutModel copyWith({  num? id,
  String? title,
  String? imageUrl,
  String? details,
  String? createdAt,
  String? updatedAt,
}) => BagmaraAboutModel(  id: id ?? _id,
  title: title ?? _title,
  imageUrl: imageUrl ?? _imageUrl,
  details: details ?? _details,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get imageUrl => _imageUrl;
  String? get details => _details;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image_url'] = _imageUrl;
    map['details'] = _details;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}