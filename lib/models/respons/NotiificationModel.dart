/// id : 1
/// title : "dsfsd"
/// message : "sdfsd"
/// url : "dsjfhjkshdfjsd"
/// image_url : "dshgfhsjgdjf"
/// created_at : "2023-08-25T16:29:05.000000Z"
/// updated_at : "2023-08-25T16:29:05.000000Z"





///api/notification

class NotiificationModel {
  NotiificationModel({
      num? id, 
      String? title, 
      String? message, 
      String? url, 
      String? imageUrl, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _message = message;
    _url = url;
    _imageUrl = imageUrl;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  NotiificationModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _message = json['message'];
    _url = json['url'];
    _imageUrl = json['image_url'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _message;
  String? _url;
  String? _imageUrl;
  String? _createdAt;
  String? _updatedAt;
NotiificationModel copyWith({  num? id,
  String? title,
  String? message,
  String? url,
  String? imageUrl,
  String? createdAt,
  String? updatedAt,
}) => NotiificationModel(  id: id ?? _id,
  title: title ?? _title,
  message: message ?? _message,
  url: url ?? _url,
  imageUrl: imageUrl ?? _imageUrl,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get message => _message;
  String? get url => _url;
  String? get imageUrl => _imageUrl;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['message'] = _message;
    map['url'] = _url;
    map['image_url'] = _imageUrl;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}