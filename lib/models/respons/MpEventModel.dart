/// id : 3
/// title : "assadsa"
/// image_url : "mp_events/59vAvHHxmTICWBPUW2Pr6HaEVMKoBsGzl4p94Egs.png"
/// date_start : "2023-08-10"
/// address : "sadsa"
/// details : "asdasd"
/// created_at : "2023-08-10T13:25:38.000000Z"
/// updated_at : "2023-08-10T13:25:38.000000Z"

class MpEventModel {
  MpEventModel({
      num? id, 
      String? title, 
      String? imageUrl, 
      String? dateStart, 
      String? address, 
      String? details, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _imageUrl = imageUrl;
    _dateStart = dateStart;
    _address = address;
    _details = details;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  MpEventModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _imageUrl = json['image_url'];
    _dateStart = json['date_start'];
    _address = json['address'];
    _details = json['details'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _imageUrl;
  String? _dateStart;
  String? _address;
  String? _details;
  String? _createdAt;
  String? _updatedAt;
MpEventModel copyWith({  num? id,
  String? title,
  String? imageUrl,
  String? dateStart,
  String? address,
  String? details,
  String? createdAt,
  String? updatedAt,
}) => MpEventModel(  id: id ?? _id,
  title: title ?? _title,
  imageUrl: imageUrl ?? _imageUrl,
  dateStart: dateStart ?? _dateStart,
  address: address ?? _address,
  details: details ?? _details,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get imageUrl => _imageUrl;
  String? get dateStart => _dateStart;
  String? get address => _address;
  String? get details => _details;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image_url'] = _imageUrl;
    map['date_start'] = _dateStart;
    map['address'] = _address;
    map['details'] = _details;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}