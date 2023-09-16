/// user : {"id":272,"name":"মোঃ আঃ ছাত্তার প্রাঃ","father_husband":"মৃত তারু প্রাঃ","mother":"মৃত ছাবেদা বেওয়া","date_of_birth":null,"mobile_number":"01750228861","email":null,"nid":"4646430811","address":"কাচারি","unit_id":null,"designation_party_id":null,"designation_citizen_id":null,"profile_image":"profile_images/jJv62TzuFJjmXKFIVVjbzkU9bxH0lKAdmilIun3u.png","role":"default_role","reffer_code":"aypqoCbw","under_reffer_code":null,"membership_card_no":null,"created_at":"2023-09-11T06:45:12.000000Z","updated_at":"2023-09-16T06:50:31.000000Z","committee_id":null,"executive_committee_id":null,"gender":"Male","union_id":8,"ward_no":"9","upazia_id":1,"voter_kendro":64,"admins_id":5,"voter_kendro_no":"58","roles":[{"id":4,"name":"Vote Center Committee","tag":"election_commission","created_at":"2023-09-04T23:44:39.000000Z","updated_at":"2023-09-04T23:44:39.000000Z","pivot":{"user_id":272,"role_id":4}}]}
/// token : "97|BLH1yrh36s7isZfKoW08xfmWbpYe1xZvt0HdWkhu"

class UserTest {
  UserTest({
      User? user, 
      String? token,}){
    _user = user;
    _token = token;
}

  UserTest.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  User? _user;
  String? _token;
UserTest copyWith({  User? user,
  String? token,
}) => UserTest(  user: user ?? _user,
  token: token ?? _token,
);
  User? get user => _user;
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

/// id : 272
/// name : "মোঃ আঃ ছাত্তার প্রাঃ"
/// father_husband : "মৃত তারু প্রাঃ"
/// mother : "মৃত ছাবেদা বেওয়া"
/// date_of_birth : null
/// mobile_number : "01750228861"
/// email : null
/// nid : "4646430811"
/// address : "কাচারি"
/// unit_id : null
/// designation_party_id : null
/// designation_citizen_id : null
/// profile_image : "profile_images/jJv62TzuFJjmXKFIVVjbzkU9bxH0lKAdmilIun3u.png"
/// role : "default_role"
/// reffer_code : "aypqoCbw"
/// under_reffer_code : null
/// membership_card_no : null
/// created_at : "2023-09-11T06:45:12.000000Z"
/// updated_at : "2023-09-16T06:50:31.000000Z"
/// committee_id : null
/// executive_committee_id : null
/// gender : "Male"
/// union_id : 8
/// ward_no : "9"
/// upazia_id : 1
/// voter_kendro : 64
/// admins_id : 5
/// voter_kendro_no : "58"
/// roles : [{"id":4,"name":"Vote Center Committee","tag":"election_commission","created_at":"2023-09-04T23:44:39.000000Z","updated_at":"2023-09-04T23:44:39.000000Z","pivot":{"user_id":272,"role_id":4}}]

class User {
  User({
      num? id, 
      String? name, 
      String? fatherHusband, 
      String? mother, 
      dynamic dateOfBirth, 
      String? mobileNumber, 
      dynamic email, 
      String? nid, 
      String? address, 
      dynamic unitId, 
      dynamic designationPartyId, 
      dynamic designationCitizenId, 
      String? profileImage, 
      String? role, 
      String? refferCode, 
      dynamic underRefferCode, 
      dynamic membershipCardNo, 
      String? createdAt, 
      String? updatedAt, 
      dynamic committeeId, 
      dynamic executiveCommitteeId, 
      String? gender, 
      num? unionId, 
      String? wardNo, 
      num? upaziaId, 
      num? voterKendro, 
      num? adminsId, 
      String? voterKendroNo, 
      List<Roles>? roles,}){
    _id = id;
    _name = name;
    _fatherHusband = fatherHusband;
    _mother = mother;
    _dateOfBirth = dateOfBirth;
    _mobileNumber = mobileNumber;
    _email = email;
    _nid = nid;
    _address = address;
    _unitId = unitId;
    _designationPartyId = designationPartyId;
    _designationCitizenId = designationCitizenId;
    _profileImage = profileImage;
    _role = role;
    _refferCode = refferCode;
    _underRefferCode = underRefferCode;
    _membershipCardNo = membershipCardNo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _committeeId = committeeId;
    _executiveCommitteeId = executiveCommitteeId;
    _gender = gender;
    _unionId = unionId;
    _wardNo = wardNo;
    _upaziaId = upaziaId;
    _voterKendro = voterKendro;
    _adminsId = adminsId;
    _voterKendroNo = voterKendroNo;
    _roles = roles;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _fatherHusband = json['father_husband'];
    _mother = json['mother'];
    _dateOfBirth = json['date_of_birth'];
    _mobileNumber = json['mobile_number'];
    _email = json['email'];
    _nid = json['nid'];
    _address = json['address'];
    _unitId = json['unit_id'];
    _designationPartyId = json['designation_party_id'];
    _designationCitizenId = json['designation_citizen_id'];
    _profileImage = json['profile_image'];
    _role = json['role'];
    _refferCode = json['reffer_code'];
    _underRefferCode = json['under_reffer_code'];
    _membershipCardNo = json['membership_card_no'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _committeeId = json['committee_id'];
    _executiveCommitteeId = json['executive_committee_id'];
    _gender = json['gender'];
    _unionId = json['union_id'];
    _wardNo = json['ward_no'];
    _upaziaId = json['upazia_id'];
    _voterKendro = json['voter_kendro'];
    _adminsId = json['admins_id'];
    _voterKendroNo = json['voter_kendro_no'];
    if (json['roles'] != null) {
      _roles = [];
      json['roles'].forEach((v) {
        _roles?.add(Roles.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _fatherHusband;
  String? _mother;
  dynamic _dateOfBirth;
  String? _mobileNumber;
  dynamic _email;
  String? _nid;
  String? _address;
  dynamic _unitId;
  dynamic _designationPartyId;
  dynamic _designationCitizenId;
  String? _profileImage;
  String? _role;
  String? _refferCode;
  dynamic _underRefferCode;
  dynamic _membershipCardNo;
  String? _createdAt;
  String? _updatedAt;
  dynamic _committeeId;
  dynamic _executiveCommitteeId;
  String? _gender;
  num? _unionId;
  String? _wardNo;
  num? _upaziaId;
  num? _voterKendro;
  num? _adminsId;
  String? _voterKendroNo;
  List<Roles>? _roles;
User copyWith({  num? id,
  String? name,
  String? fatherHusband,
  String? mother,
  dynamic dateOfBirth,
  String? mobileNumber,
  dynamic email,
  String? nid,
  String? address,
  dynamic unitId,
  dynamic designationPartyId,
  dynamic designationCitizenId,
  String? profileImage,
  String? role,
  String? refferCode,
  dynamic underRefferCode,
  dynamic membershipCardNo,
  String? createdAt,
  String? updatedAt,
  dynamic committeeId,
  dynamic executiveCommitteeId,
  String? gender,
  num? unionId,
  String? wardNo,
  num? upaziaId,
  num? voterKendro,
  num? adminsId,
  String? voterKendroNo,
  List<Roles>? roles,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  fatherHusband: fatherHusband ?? _fatherHusband,
  mother: mother ?? _mother,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  mobileNumber: mobileNumber ?? _mobileNumber,
  email: email ?? _email,
  nid: nid ?? _nid,
  address: address ?? _address,
  unitId: unitId ?? _unitId,
  designationPartyId: designationPartyId ?? _designationPartyId,
  designationCitizenId: designationCitizenId ?? _designationCitizenId,
  profileImage: profileImage ?? _profileImage,
  role: role ?? _role,
  refferCode: refferCode ?? _refferCode,
  underRefferCode: underRefferCode ?? _underRefferCode,
  membershipCardNo: membershipCardNo ?? _membershipCardNo,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  committeeId: committeeId ?? _committeeId,
  executiveCommitteeId: executiveCommitteeId ?? _executiveCommitteeId,
  gender: gender ?? _gender,
  unionId: unionId ?? _unionId,
  wardNo: wardNo ?? _wardNo,
  upaziaId: upaziaId ?? _upaziaId,
  voterKendro: voterKendro ?? _voterKendro,
  adminsId: adminsId ?? _adminsId,
  voterKendroNo: voterKendroNo ?? _voterKendroNo,
  roles: roles ?? _roles,
);
  num? get id => _id;
  String? get name => _name;
  String? get fatherHusband => _fatherHusband;
  String? get mother => _mother;
  dynamic get dateOfBirth => _dateOfBirth;
  String? get mobileNumber => _mobileNumber;
  dynamic get email => _email;
  String? get nid => _nid;
  String? get address => _address;
  dynamic get unitId => _unitId;
  dynamic get designationPartyId => _designationPartyId;
  dynamic get designationCitizenId => _designationCitizenId;
  String? get profileImage => _profileImage;
  String? get role => _role;
  String? get refferCode => _refferCode;
  dynamic get underRefferCode => _underRefferCode;
  dynamic get membershipCardNo => _membershipCardNo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get committeeId => _committeeId;
  dynamic get executiveCommitteeId => _executiveCommitteeId;
  String? get gender => _gender;
  num? get unionId => _unionId;
  String? get wardNo => _wardNo;
  num? get upaziaId => _upaziaId;
  num? get voterKendro => _voterKendro;
  num? get adminsId => _adminsId;
  String? get voterKendroNo => _voterKendroNo;
  List<Roles>? get roles => _roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['father_husband'] = _fatherHusband;
    map['mother'] = _mother;
    map['date_of_birth'] = _dateOfBirth;
    map['mobile_number'] = _mobileNumber;
    map['email'] = _email;
    map['nid'] = _nid;
    map['address'] = _address;
    map['unit_id'] = _unitId;
    map['designation_party_id'] = _designationPartyId;
    map['designation_citizen_id'] = _designationCitizenId;
    map['profile_image'] = _profileImage;
    map['role'] = _role;
    map['reffer_code'] = _refferCode;
    map['under_reffer_code'] = _underRefferCode;
    map['membership_card_no'] = _membershipCardNo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['committee_id'] = _committeeId;
    map['executive_committee_id'] = _executiveCommitteeId;
    map['gender'] = _gender;
    map['union_id'] = _unionId;
    map['ward_no'] = _wardNo;
    map['upazia_id'] = _upaziaId;
    map['voter_kendro'] = _voterKendro;
    map['admins_id'] = _adminsId;
    map['voter_kendro_no'] = _voterKendroNo;
    if (_roles != null) {
      map['roles'] = _roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// name : "Vote Center Committee"
/// tag : "election_commission"
/// created_at : "2023-09-04T23:44:39.000000Z"
/// updated_at : "2023-09-04T23:44:39.000000Z"
/// pivot : {"user_id":272,"role_id":4}

class Roles {
  Roles({
      num? id, 
      String? name, 
      String? tag, 
      String? createdAt, 
      String? updatedAt, 
      Pivot? pivot,}){
    _id = id;
    _name = name;
    _tag = tag;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _pivot = pivot;
}

  Roles.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _tag = json['tag'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  num? _id;
  String? _name;
  String? _tag;
  String? _createdAt;
  String? _updatedAt;
  Pivot? _pivot;
Roles copyWith({  num? id,
  String? name,
  String? tag,
  String? createdAt,
  String? updatedAt,
  Pivot? pivot,
}) => Roles(  id: id ?? _id,
  name: name ?? _name,
  tag: tag ?? _tag,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  pivot: pivot ?? _pivot,
);
  num? get id => _id;
  String? get name => _name;
  String? get tag => _tag;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Pivot? get pivot => _pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['tag'] = _tag;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_pivot != null) {
      map['pivot'] = _pivot?.toJson();
    }
    return map;
  }

}

/// user_id : 272
/// role_id : 4

class Pivot {
  Pivot({
      num? userId, 
      num? roleId,}){
    _userId = userId;
    _roleId = roleId;
}

  Pivot.fromJson(dynamic json) {
    _userId = json['user_id'];
    _roleId = json['role_id'];
  }
  num? _userId;
  num? _roleId;
Pivot copyWith({  num? userId,
  num? roleId,
}) => Pivot(  userId: userId ?? _userId,
  roleId: roleId ?? _roleId,
);
  num? get userId => _userId;
  num? get roleId => _roleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['role_id'] = _roleId;
    return map;
  }

}