
import 'package:smart_mp/models/respons/DestinationCitizan.dart';
import 'package:smart_mp/models/respons/DestinationParty.dart';
import 'package:smart_mp/models/respons/Union.dart';
import 'package:smart_mp/models/respons/Upazila.dart';
import 'package:smart_mp/models/respons/committee.dart';

import 'AdminLoginModel.dart';
import 'ExecutiveCommittee.dart';

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
    num? id,
    String? name,
    String? fatherHusband,
    String? mother,
    String? dateOfBirth,
    String? mobileNumber,
    String? email,
    String? nid,
    String? address,
    num? unitId,
    num? designationPartyId,
    num? designationCitizenId,
    String? profileImage,
    String? role,
    String? refferCode,
    String? underRefferCode,
    String? membershipCardNo,
    String? createdAt,
    String? updatedAt,
    num? committeeId,
    num? executiveCommitteeId,
    String? gender,
    num? unionId,
    String? wardNo,
    num? upaziaId,
    VoterKendro? voterKendro,
    num? adminsId,
    num? voterKendroNo,
    num? editorId,
    num? convenersId,
    String? others,
    List<Roles>? roles,
    DestinationParty? designationParty,
    DestinationCitizan? designationCitizen,
    Upazila? upazila,
    Union? union,
    Committee? committee,
    ExecutiveCommittee? executiveCommittee,
    AdminModel? coordinator,
    AdminModel? conveners,
    AdminModel? admin,}){
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
    _editorId = editorId;
    _convenersId = convenersId;
    _others = others;
    _roles = roles;
    _designationParty = designationParty;
    _designationCitizen = designationCitizen;
    _upazila = upazila;
    _union = union;
    _committee = committee;
    _executiveCommittee = executiveCommittee;
    _coordinator = coordinator;
    _conveners = conveners;
    _admin = admin;
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
    _voterKendro = json['voter_kendro'] != null ? VoterKendro.fromJson(json['voter_kendro']) : null;
    _adminsId = json['admins_id'];
    _voterKendroNo = json['voter_kendro_no'];
    _editorId = json['editor_id'];
    _convenersId = json['conveners_id'];
    _others = json['others'];
    if (json['roles'] != null) {
      _roles = [];
      json['roles'].forEach((v) {
        _roles?.add(Roles.fromJson(v));
      });
    }
    _designationParty = json['designation_party'] != null ? DestinationParty.fromJson(json['designation_party']) : null;
    _designationCitizen = json['designation_citizen'] != null ? DestinationCitizan.fromJson(json['designation_citizen']) : null;
    _upazila = json['upazila'] != null ? Upazila.fromJson(json['upazila']) : null;
    _union = json['union'] != null ? Union.fromJson(json['union']) : null;
    _committee = json['committee'] != null ? Committee.fromJson(json['committee']) : null;
    _executiveCommittee = json['executive_committee'] != null ? ExecutiveCommittee.fromJson(json['executive_committee']) : null;
    _coordinator = json['coordinator'] != null ? AdminModel.fromJson(json['coordinator']) : null;
    _conveners = json['conveners'] != null ? AdminModel.fromJson(json['conveners']) : null;
    _admin = json['admin'] != null ? AdminModel.fromJson(json['admin']) : null;
  }
  num? _id;
  String? _name;
  String? _fatherHusband;
  String? _mother;
  String? _dateOfBirth;
  String? _mobileNumber;
  String? _email;
  String? _nid;
  String? _address;
  num? _unitId;
  num? _designationPartyId;
  num? _designationCitizenId;
  String? _profileImage;
  String? _role;
  String? _refferCode;
  String? _underRefferCode;
  String? _membershipCardNo;
  String? _createdAt;
  String? _updatedAt;
  num? _committeeId;
  num? _executiveCommitteeId;
  String? _gender;
  num? _unionId;
  String? _wardNo;
  num? _upaziaId;
  VoterKendro? _voterKendro;
  num? _adminsId;
  num? _voterKendroNo;
  num? _editorId;
  num? _convenersId;
  String? _others;
  List<Roles>? _roles;
  DestinationParty? _designationParty;
  DestinationCitizan? _designationCitizen;
  Upazila? _upazila;
  Union? _union;
  Committee? _committee;
  ExecutiveCommittee? _executiveCommittee;
  AdminModel? _coordinator;
  AdminModel? _conveners;
  AdminModel? _admin;
  User copyWith({  num? id,
    String? name,
    String? fatherHusband,
    String? mother,
    String? dateOfBirth,
    String? mobileNumber,
    String? email,
    String? nid,
    String? address,
    num? unitId,
    num? designationPartyId,
    num? designationCitizenId,
    String? profileImage,
    String? role,
    String? refferCode,
    String? underRefferCode,
    String? membershipCardNo,
    String? createdAt,
    String? updatedAt,
    num? committeeId,
    num? executiveCommitteeId,
    String? gender,
    num? unionId,
    String? wardNo,
    num? upaziaId,
    VoterKendro? voterKendro,
    num? adminsId,
    num? voterKendroNo,
    num? editorId,
    num? convenersId,
    String? others,
    List<Roles>? roles,
    DestinationParty? designationParty,
    DestinationCitizan? designationCitizen,
    Upazila? upazila,
    Union? union,
    Committee? committee,
    ExecutiveCommittee? executiveCommittee,
    AdminModel? coordinator,
    AdminModel? conveners,
    AdminModel? admin,
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
    editorId: editorId ?? _editorId,
    convenersId: convenersId ?? _convenersId,
    others: others ?? _others,
    roles: roles ?? _roles,
    designationParty: designationParty ?? _designationParty,
    designationCitizen: designationCitizen ?? _designationCitizen,
    upazila: upazila ?? _upazila,
    union: union ?? _union,
    committee: committee ?? _committee,
    executiveCommittee: executiveCommittee ?? _executiveCommittee,
    coordinator: coordinator ?? _coordinator,
    conveners: conveners ?? _conveners,
    admin: admin ?? _admin,
  );
  num? get id => _id;
  String? get name => _name;
  String? get fatherHusband => _fatherHusband;
  String? get mother => _mother;
  String? get dateOfBirth => _dateOfBirth;
  String? get mobileNumber => _mobileNumber;
  String? get email => _email;
  String? get nid => _nid;
  String? get address => _address;
  num? get unitId => _unitId;
  num? get designationPartyId => _designationPartyId;
  num? get designationCitizenId => _designationCitizenId;
  String? get profileImage => _profileImage;
  String? get role => _role;
  String? get refferCode => _refferCode;
  String? get underRefferCode => _underRefferCode;
  String? get membershipCardNo => _membershipCardNo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get committeeId => _committeeId;
  num? get executiveCommitteeId => _executiveCommitteeId;
  String? get gender => _gender;
  num? get unionId => _unionId;
  String? get wardNo => _wardNo;
  num? get upaziaId => _upaziaId;
  VoterKendro? get voterKendro => _voterKendro;
  num? get adminsId => _adminsId;
  num? get voterKendroNo => _voterKendroNo;
  num? get editorId => _editorId;
  num? get convenersId => _convenersId;
  String? get others => _others;
  List<Roles>? get roles => _roles;
  DestinationParty? get designationParty => _designationParty;
  DestinationCitizan? get designationCitizen => _designationCitizen;
  Upazila? get upazila => _upazila;
  Union? get union => _union;
  Committee? get committee => _committee;
  ExecutiveCommittee? get executiveCommittee => _executiveCommittee;
  AdminModel? get coordinator => _coordinator;
  AdminModel? get conveners => _conveners;
  AdminModel? get admin => _admin;

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
    if (_voterKendro != null) {
      map['voter_kendro'] = _voterKendro?.toJson();
    }
    map['admins_id'] = _adminsId;
    map['voter_kendro_no'] = _voterKendroNo;
    map['editor_id'] = _editorId;
    map['conveners_id'] = _convenersId;
    map['others'] = _others;
    if (_roles != null) {
      map['roles'] = _roles?.map((v) => v.toJson()).toList();
    }
    if (_designationParty != null) {
      map['designation_party'] = _designationParty?.toJson();
    }
    if (_designationCitizen != null) {
      map['designation_citizen'] = _designationCitizen?.toJson();
    }
    if (_upazila != null) {
      map['upazila'] = _upazila?.toJson();
    }
    if (_union != null) {
      map['union'] = _union?.toJson();
    }
    if (_committee != null) {
      map['committee'] = _committee?.toJson();
    }
    if (_executiveCommittee != null) {
      map['executive_committee'] = _executiveCommittee?.toJson();
    }
    if (_coordinator != null) {
      map['coordinator'] = _coordinator?.toJson();
    }
    if (_conveners != null) {
      map['conveners'] = _conveners?.toJson();
    }
    if (_admin != null) {
      map['admin'] = _admin?.toJson();
    }
    return map;
  }

}






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

class VoterKendro {
  VoterKendro({
    num? id,
    String? name,
    num? unionsId,
    String? createdAt,
    String? updatedAt,
    dynamic wardNo,
    String? voterKendroNo,}){
    _id = id;
    _name = name;
    _unionsId = unionsId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _wardNo = wardNo;
    _voterKendroNo = voterKendroNo;
  }

  VoterKendro.fromJson(dynamic json) {
    if (json != null && json is Map<String, dynamic>) {
      _id = json['id'];
      _name = json['name'];
      _unionsId = json['unions_id'];
      _createdAt = json['created_at'];
      _updatedAt = json['updated_at'];
      _wardNo = json['ward_no'];
      _voterKendroNo = json['voter_kendro_no'];
    } else {
      // Handle the case where json is not as expected.
    }
  }
  num? _id;
  String? _name;
  num? _unionsId;
  String? _createdAt;
  String? _updatedAt;
  dynamic _wardNo;
  String? _voterKendroNo;
  VoterKendro copyWith({  num? id,
    String? name,
    num? unionsId,
    String? createdAt,
    String? updatedAt,
    dynamic wardNo,
    String? voterKendroNo,
  }) => VoterKendro(  id: id ?? _id,
    name: name ?? _name,
    unionsId: unionsId ?? _unionsId,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    wardNo: wardNo ?? _wardNo,
    voterKendroNo: voterKendroNo ?? _voterKendroNo,
  );
  num? get id => _id;
  String? get name => _name;
  num? get unionsId => _unionsId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get wardNo => _wardNo;
  String? get voterKendroNo => _voterKendroNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['unions_id'] = _unionsId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['ward_no'] = _wardNo;
    map['voter_kendro_no'] = _voterKendroNo;
    return map;
  }

}

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