class Committee {
  Committee({
      int? id,
      String? title, 
      String? imageUrl, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _imageUrl = imageUrl;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Committee.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _imageUrl = json['image_url'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _title;
  String? _imageUrl;
  String? _createdAt;
  String? _updatedAt;
Committee copyWith({  int? id,
  String? title,
  String? imageUrl,
  String? createdAt,
  String? updatedAt,
}) => Committee(  id: id ?? _id,
  title: title ?? _title,
  imageUrl: imageUrl ?? _imageUrl,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get title => _title;
  String? get imageUrl => _imageUrl;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image_url'] = _imageUrl;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}