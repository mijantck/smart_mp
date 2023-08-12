/// id : 1
/// title : "dfkjsdh"
/// image_url : "news/ilNTJr5DMuoz0lyB126RA1IB4NgSc4I3WvMW9lRG.png"
/// type : "event"
/// url : null
/// details : "sdfsdfds"
/// created_at : "2023-08-06T18:27:07.000000Z"
/// updated_at : "2023-08-06T18:27:07.000000Z"

class NewModel {
  NewModel({
      num? id, 
      String? title, 
      String? imageUrl, 
      String? type, 
      dynamic url, 
      String? details, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _imageUrl = imageUrl;
    _type = type;
    _url = url;
    _details = details;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  NewModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _imageUrl = json['image_url'];
    _type = json['type'];
    _url = json['url'];
    _details = json['details'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _imageUrl;
  String? _type;
  dynamic _url;
  String? _details;
  String? _createdAt;
  String? _updatedAt;
NewModel copyWith({  num? id,
  String? title,
  String? imageUrl,
  String? type,
  dynamic url,
  String? details,
  String? createdAt,
  String? updatedAt,
}) => NewModel(  id: id ?? _id,
  title: title ?? _title,
  imageUrl: imageUrl ?? _imageUrl,
  type: type ?? _type,
  url: url ?? _url,
  details: details ?? _details,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get imageUrl => _imageUrl;
  String? get type => _type;
  dynamic get url => _url;
  String? get details => _details;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image_url'] = _imageUrl;
    map['type'] = _type;
    map['url'] = _url;
    map['details'] = _details;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}