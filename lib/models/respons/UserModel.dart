
class UserModel {
  UserModel({
      User? user, 
      String? token,}){
    _user = user;
    _token = token;
}

  UserModel.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  User? _user;
  String? _token;
UserModel copyWith({  User? user,
  String? token,
}) => UserModel(  user: user ?? _user,
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

class User {
  User({
      String? name, 
      String? fatherHusband, 
      String? mother, 
      String? dateOfBirth, 
      String? mobileNumber, 
      String? email, 
      String? nid, 
      String? address, 
      int? unitId,
      int? designationPartyId,
      int? designationCitizenId,
      String? role, 
      String? underRefferCode, 
      String? membershipCardNo,
      int? committeeId,
      int? executiveCommitteeId,
      String? gender, 
      int? unionId,
      String? wardNo, 
      int? upaziaId,
      String? refferCode, 
      String? profileImage, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
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
    _role = role;
    _underRefferCode = underRefferCode;
    _membershipCardNo = membershipCardNo;
    _committeeId = committeeId;
    _executiveCommitteeId = executiveCommitteeId;
    _gender = gender;
    _unionId = unionId;
    _wardNo = wardNo;
    _upaziaId = upaziaId;
    _refferCode = refferCode;
    _profileImage = profileImage;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  User.fromJson(dynamic json) {
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
    _role = json['role'];
    _underRefferCode = json['under_reffer_code'];
    _membershipCardNo = json['membership_card_no'];
    _committeeId = json['committee_id'];
    _executiveCommitteeId = json['executive_committee_id'];
    _gender = json['gender'];
    _unionId = json['union_id'];
    _wardNo = json['ward_no'];
    _upaziaId = json['upazia_id'];
    _refferCode = json['reffer_code'];
    _profileImage = json['profile_image'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _name;
  String? _fatherHusband;
  String? _mother;
  String? _dateOfBirth;
  String? _mobileNumber;
  String? _email;
  String? _nid;
  String? _address;
  int? _unitId;
  int? _designationPartyId;
  int? _designationCitizenId;
  String? _role;
  String? _underRefferCode;
  String? _membershipCardNo;
  int? _committeeId;
  int? _executiveCommitteeId;
  String? _gender;
  int? _unionId;
  String? _wardNo;
  int? _upaziaId;
  String? _refferCode;
  String? _profileImage;
  String? _updatedAt;
  String? _createdAt;
  int? _id;
User copyWith({  String? name,
  String? fatherHusband,
  String? mother,
  String? dateOfBirth,
  String? mobileNumber,
  String? email,
  String? nid,
  String? address,
  int? unitId,
  int? designationPartyId,
  int? designationCitizenId,
  String? role,
  String? underRefferCode,
  String? membershipCardNo,
  int? committeeId,
  int? executiveCommitteeId,
  String? gender,
  int? unionId,
  String? wardNo,
  int? upaziaId,
  String? refferCode,
  String? profileImage,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => User(  name: name ?? _name,
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
  role: role ?? _role,
  underRefferCode: underRefferCode ?? _underRefferCode,
  membershipCardNo: membershipCardNo ?? _membershipCardNo,
  committeeId: committeeId ?? _committeeId,
  executiveCommitteeId: executiveCommitteeId ?? _executiveCommitteeId,
  gender: gender ?? _gender,
  unionId: unionId ?? _unionId,
  wardNo: wardNo ?? _wardNo,
  upaziaId: upaziaId ?? _upaziaId,
  refferCode: refferCode ?? _refferCode,
  profileImage: profileImage ?? _profileImage,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get name => _name;
  String? get fatherHusband => _fatherHusband;
  String? get mother => _mother;
  String? get dateOfBirth => _dateOfBirth;
  String? get mobileNumber => _mobileNumber;
  String? get email => _email;
  String? get nid => _nid;
  String? get address => _address;
  int? get unitId => _unitId;
  int? get designationPartyId => _designationPartyId;
  int? get designationCitizenId => _designationCitizenId;
  String? get role => _role;
  String? get underRefferCode => _underRefferCode;
  String? get membershipCardNo => _membershipCardNo;
  int? get committeeId => _committeeId;
  int? get executiveCommitteeId => _executiveCommitteeId;
  String? get gender => _gender;
  int? get unionId => _unionId;
  String? get wardNo => _wardNo;
  int? get upaziaId => _upaziaId;
  String? get refferCode => _refferCode;
  String? get profileImage => _profileImage;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    map['role'] = _role;
    map['under_reffer_code'] = _underRefferCode;
    map['membership_card_no'] = _membershipCardNo;
    map['committee_id'] = _committeeId;
    map['executive_committee_id'] = _executiveCommitteeId;
    map['gender'] = _gender;
    map['union_id'] = _unionId;
    map['ward_no'] = _wardNo;
    map['upazia_id'] = _upaziaId;
    map['reffer_code'] = _refferCode;
    map['profile_image'] = _profileImage;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}