import 'package:smart_mp/models/respons/ConvenerModel.dart';
import 'package:smart_mp/models/respons/Union.dart';


class AdminLoginModel {
  AdminLoginModel({
      AdminModel? user,
      String? token,}){
    _user = user;
    _token = token;
}

  AdminLoginModel.fromJson(dynamic json) {
    _user = json['user'] != null ? AdminModel.fromJson(json['user']) : null;
    _token = json['token'];
  }
  AdminModel? _user;
  String? _token;
AdminLoginModel copyWith({  AdminModel? user,
  String? token,
}) => AdminLoginModel(  user: user ?? _user,
  token: token ?? _token,
);
  AdminModel? get user => _user;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}


class AdminModel {
  AdminModel({
      num? id, 
      String? userName, 
      String? email, 
      String? fullName, 
      String? userRole, 
      String? createdAt, 
      String? updatedAt, 
      num? unionsId,
      num? wardNo,
      String? phone,
      bool? smssend,
      bool? edit,
      bool? delete, 
      String? imageUrl, 
      num? coordinatorId, 
      num? committeeId,
      AdminModel? coordinator,
      Committee? committee,
      Union? unions,
  }){
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
    _smssend = smssend;
    _edit = edit;
    _delete = delete;
    _imageUrl = imageUrl;
    _coordinatorId = coordinatorId;
    _committeeId = committeeId;
    _coordinator = coordinator;
    _committee = committee;
    _unions = unions;
}

  AdminModel.fromJson(dynamic json) {
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
    _smssend = json['smssend'];
    _edit = json['edit'];
    _delete = json['delete'];
    _imageUrl = json['image_url'];
    _coordinatorId = json['coordinator_id'];
    _committeeId = json['committee_id'];
    _coordinator = json['coordinator'] != null ? AdminModel.fromJson(json['coordinator']) : null;
    _committee = json['committee'] != null ? Committee.fromJson(json['committee']) : null;
    _unions = json['unions'] != null ? Union.fromJson(json['unions']) : null;
  }
  num? _id;
  String? _userName;
  String? _email;
  String? _fullName;
  String? _userRole;
  String? _createdAt;
  String? _updatedAt;
  num? _unionsId;
  num? _wardNo;
  String? _phone;
  bool? _smssend;
  bool? _edit;
  bool? _delete;
  String? _imageUrl;
  num? _coordinatorId;
  num? _committeeId;
  AdminModel? _coordinator;
  Committee? _committee;
  Union? _unions;
AdminModel copyWith({  num? id,
  String? userName,
  String? email,
  String? fullName,
  String? userRole,
  String? createdAt,
  String? updatedAt,
  num? unionsId,
  num? wardNo,
  String? phone,
  bool? smssend,
  bool? edit,
  bool? delete,
  String? imageUrl,
  num? coordinatorId,
  num? committeeId,
  AdminModel? coordinator,
  Committee? committee,
  Union? unions,
}) => AdminModel(  id: id ?? _id,
  userName: userName ?? _userName,
  email: email ?? _email,
  fullName: fullName ?? _fullName,
  userRole: userRole ?? _userRole,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  unionsId: unionsId ?? _unionsId,
  wardNo: wardNo ?? _wardNo,
  phone: phone ?? _phone,
  smssend: smssend ?? _smssend,
  edit: edit ?? _edit,
  delete: delete ?? _delete,
  imageUrl: imageUrl ?? _imageUrl,
  coordinatorId: coordinatorId ?? _coordinatorId,
  committeeId: committeeId ?? _committeeId,
  coordinator: coordinator ?? _coordinator,
  committee: committee ?? _committee,
  unions: unions ?? _unions,
);
  num? get id => _id;
  String? get userName => _userName;
  String? get email => _email;
  String? get fullName => _fullName;
  String? get userRole => _userRole;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get unionsId => _unionsId;
  num? get wardNo => _wardNo;
  String? get phone => _phone;
  bool? get smssend => _smssend;
  bool? get edit => _edit;
  bool? get delete => _delete;
  String? get imageUrl => _imageUrl;
  num? get coordinatorId => _coordinatorId;
  num? get committeeId => _committeeId;
  AdminModel? get coordinator => _coordinator;
  Committee? get committee => _committee;
  Union? get unions => _unions;

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
    map['smssend'] = _smssend;
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
    if (_unions != null) {
      map['unions'] = _unions?.toJson();
    }
    return map;
  }

}