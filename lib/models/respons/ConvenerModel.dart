
class ConvenerModel {
  ConvenerModel({
      num? id, 
      String? userName, 
      String? email, 
      String? fullName, 
      String? userRole, 
      String? createdAt, 
      String? updatedAt, 
      num? unionsId, 
      dynamic wardNo, 
      String? phone, 
      bool? edit, 
      bool? delete, 
      String? imageUrl, 
      num? coordinatorId, 
      num? committeeId, 
      Coordinator? coordinator, 
      Committee? committee,}){
    _id = id;
    _userName = userName;
    _email = email;
    _fullName = fullName;
    _userRole = userRole;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _unionsId = unionsId;
    _wardNo = wardNo;
    _phone = phone;
    _edit = edit;
    _delete = delete;
    _imageUrl = imageUrl;
    _coordinatorId = coordinatorId;
    _committeeId = committeeId;
    _coordinator = coordinator;
    _committee = committee;
}

  ConvenerModel.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['userName'];
    _email = json['email'];
    _fullName = json['full_name'];
    _userRole = json['user_role'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _unionsId = json['unions_id'];
    _wardNo = json['ward_no'];
    _phone = json['phone'];
    _edit = json['edit'];
    _delete = json['delete'];
    _imageUrl = json['image_url'];
    _coordinatorId = json['coordinator_id'];
    _committeeId = json['committee_id'];
    _coordinator = json['coordinator'] != null ? Coordinator.fromJson(json['coordinator']) : null;
    _committee = json['committee'] != null ? Committee.fromJson(json['committee']) : null;
  }
  num? _id;
  String? _userName;
  String? _email;
  String? _fullName;
  String? _userRole;
  String? _createdAt;
  String? _updatedAt;
  num? _unionsId;
  dynamic _wardNo;
  String? _phone;
  bool? _edit;
  bool? _delete;
  String? _imageUrl;
  num? _coordinatorId;
  num? _committeeId;
  Coordinator? _coordinator;
  Committee? _committee;
ConvenerModel copyWith({  num? id,
  String? userName,
  String? email,
  String? fullName,
  String? userRole,
  String? createdAt,
  String? updatedAt,
  num? unionsId,
  dynamic wardNo,
  String? phone,
  bool? edit,
  bool? delete,
  String? imageUrl,
  num? coordinatorId,
  num? committeeId,
  Coordinator? coordinator,
  Committee? committee,
}) => ConvenerModel(  id: id ?? _id,
  userName: userName ?? _userName,
  email: email ?? _email,
  fullName: fullName ?? _fullName,
  userRole: userRole ?? _userRole,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  unionsId: unionsId ?? _unionsId,
  wardNo: wardNo ?? _wardNo,
  phone: phone ?? _phone,
  edit: edit ?? _edit,
  delete: delete ?? _delete,
  imageUrl: imageUrl ?? _imageUrl,
  coordinatorId: coordinatorId ?? _coordinatorId,
  committeeId: committeeId ?? _committeeId,
  coordinator: coordinator ?? _coordinator,
  committee: committee ?? _committee,
);
  num? get id => _id;
  String? get userName => _userName;
  String? get email => _email;
  String? get fullName => _fullName;
  String? get userRole => _userRole;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get unionsId => _unionsId;
  dynamic get wardNo => _wardNo;
  String? get phone => _phone;
  bool? get edit => _edit;
  bool? get delete => _delete;
  String? get imageUrl => _imageUrl;
  num? get coordinatorId => _coordinatorId;
  num? get committeeId => _committeeId;
  Coordinator? get coordinator => _coordinator;
  Committee? get committee => _committee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userName'] = _userName;
    map['email'] = _email;
    map['full_name'] = _fullName;
    map['user_role'] = _userRole;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['unions_id'] = _unionsId;
    map['ward_no'] = _wardNo;
    map['phone'] = _phone;
    map['edit'] = _edit;
    map['delete'] = _delete;
    map['image_url'] = _imageUrl;
    map['coordinator_id'] = _coordinatorId;
    map['committee_id'] = _committeeId;
    if (_coordinator != null) {
      map['coordinator'] = _coordinator?.toJson();
    }
    if (_committee != null) {
      map['committee'] = _committee?.toJson();
    }
    return map;
  }

}

/// id : 1
/// title : "আওয়ামী লীগ"
/// image_url : "executive_committees/3XBYOm2i9Au9OiN4ySdrlgWdAi2CnoNuTljWnzC0.png"
/// created_at : "2023-08-06T18:22:03.000000Z"
/// updated_at : "2023-08-26T06:49:21.000000Z"

class Committee {
  Committee({
      num? id, 
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
  num? _id;
  String? _title;
  String? _imageUrl;
  String? _createdAt;
  String? _updatedAt;
Committee copyWith({  num? id,
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
  num? get id => _id;
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

/// id : 5
/// userName : "মোঃ শাকিল মোড়ল"
/// email : "morolenaaudit22@gmail.com"
/// full_name : "মোঃ শাকিল মোড়ল"
/// user_role : "coordinator"
/// created_at : "2023-09-11T04:52:51.000000Z"
/// updated_at : "2023-10-05T07:25:10.000000Z"
/// unions_id : 8
/// ward_no : null
/// phone : "01709998143"
/// edit : false
/// delete : false
/// image_url : "admins/tbqDSLoITLR5pqNBIwIYc0ywu8dQIkfxlVlphKXO.jpg"
/// coordinator_id : null
/// committee_id : 1

class Coordinator {
  Coordinator({
      num? id, 
      String? userName, 
      String? email, 
      String? fullName, 
      String? userRole, 
      String? createdAt, 
      String? updatedAt, 
      num? unionsId, 
      dynamic wardNo, 
      String? phone, 
      bool? edit, 
      bool? delete, 
      String? imageUrl, 
      dynamic coordinatorId, 
      num? committeeId,}){
    _id = id;
    _userName = userName;
    _email = email;
    _fullName = fullName;
    _userRole = userRole;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _unionsId = unionsId;
    _wardNo = wardNo;
    _phone = phone;
    _edit = edit;
    _delete = delete;
    _imageUrl = imageUrl;
    _coordinatorId = coordinatorId;
    _committeeId = committeeId;
}

  Coordinator.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['userName'];
    _email = json['email'];
    _fullName = json['full_name'];
    _userRole = json['user_role'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _unionsId = json['unions_id'];
    _wardNo = json['ward_no'];
    _phone = json['phone'];
    _edit = json['edit'];
    _delete = json['delete'];
    _imageUrl = json['image_url'];
    _coordinatorId = json['coordinator_id'];
    _committeeId = json['committee_id'];
  }
  num? _id;
  String? _userName;
  String? _email;
  String? _fullName;
  String? _userRole;
  String? _createdAt;
  String? _updatedAt;
  num? _unionsId;
  dynamic _wardNo;
  String? _phone;
  bool? _edit;
  bool? _delete;
  String? _imageUrl;
  dynamic _coordinatorId;
  num? _committeeId;
Coordinator copyWith({  num? id,
  String? userName,
  String? email,
  String? fullName,
  String? userRole,
  String? createdAt,
  String? updatedAt,
  num? unionsId,
  dynamic wardNo,
  String? phone,
  bool? edit,
  bool? delete,
  String? imageUrl,
  dynamic coordinatorId,
  num? committeeId,
}) => Coordinator(  id: id ?? _id,
  userName: userName ?? _userName,
  email: email ?? _email,
  fullName: fullName ?? _fullName,
  userRole: userRole ?? _userRole,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  unionsId: unionsId ?? _unionsId,
  wardNo: wardNo ?? _wardNo,
  phone: phone ?? _phone,
  edit: edit ?? _edit,
  delete: delete ?? _delete,
  imageUrl: imageUrl ?? _imageUrl,
  coordinatorId: coordinatorId ?? _coordinatorId,
  committeeId: committeeId ?? _committeeId,
);
  num? get id => _id;
  String? get userName => _userName;
  String? get email => _email;
  String? get fullName => _fullName;
  String? get userRole => _userRole;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get unionsId => _unionsId;
  dynamic get wardNo => _wardNo;
  String? get phone => _phone;
  bool? get edit => _edit;
  bool? get delete => _delete;
  String? get imageUrl => _imageUrl;
  dynamic get coordinatorId => _coordinatorId;
  num? get committeeId => _committeeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userName'] = _userName;
    map['email'] = _email;
    map['full_name'] = _fullName;
    map['user_role'] = _userRole;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['unions_id'] = _unionsId;
    map['ward_no'] = _wardNo;
    map['phone'] = _phone;
    map['edit'] = _edit;
    map['delete'] = _delete;
    map['image_url'] = _imageUrl;
    map['coordinator_id'] = _coordinatorId;
    map['committee_id'] = _committeeId;
    return map;
  }

}