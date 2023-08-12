
import 'package:smart_mp/models/respons/DestinationCitizan.dart';
import 'package:smart_mp/models/respons/DestinationParty.dart';
import 'package:smart_mp/models/respons/ExecutiveCommittee.dart';
import 'package:smart_mp/models/respons/Union.dart';
import 'package:smart_mp/models/respons/Unit.dart';
import 'package:smart_mp/models/respons/Upazila.dart';
import 'package:smart_mp/models/respons/committee.dart';

class MemberModel {
  MemberModel({
      int? id,
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
      String? profileImage, 
      String? role, 
      String? refferCode, 
      String? underRefferCode, 
      String? membershipCardNo, 
      String? createdAt, 
      String? updatedAt, 
      int? committeeId,
      int? executiveCommitteeId,
      String? gender, 
      int? unionId,
      String? wardNo,
      int? upaziaId,
      Unit? unit, 
      DestinationParty? designationParty,
      DestinationCitizan? designationCitizen,
      Upazila? upazila, 
      Union? union, 
      Committee? committee, 
      ExecutiveCommittee? executiveCommittee,}){
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
    _unit = unit;
    _designationParty = designationParty;
    _designationCitizen = designationCitizen;
    _upazila = upazila;
    _union = union;
    _committee = committee;
    _executiveCommittee = executiveCommittee;
}

  MemberModel.fromJson(dynamic json) {
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
    _unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    _designationParty = json['designation_party'] != null ? DestinationParty.fromJson(json['designation_party']) : null;
    _designationCitizen = json['designation_citizen'] != null ? DestinationCitizan.fromJson(json['designation_citizen']) : null;
    _upazila = json['upazila'] != null ? Upazila.fromJson(json['upazila']) : null;
    _union = json['union'] != null ? Union.fromJson(json['union']) : null;
    _committee = json['committee'] != null ? Committee.fromJson(json['committee']) : null;
    _executiveCommittee = json['executive_committee'] != null ? ExecutiveCommittee.fromJson(json['executive_committee']) : null;
  }
  int? _id;
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
  String? _profileImage;
  String? _role;
  String? _refferCode;
  String? _underRefferCode;
  String? _membershipCardNo;
  String? _createdAt;
  String? _updatedAt;
  int? _committeeId;
  int? _executiveCommitteeId;
  String? _gender;
  int? _unionId;
  String? _wardNo;
  int? _upaziaId;
  Unit? _unit;
  DestinationParty? _designationParty;
  DestinationCitizan? _designationCitizen;
  Upazila? _upazila;
  Union? _union;
  Committee? _committee;
  ExecutiveCommittee? _executiveCommittee;
MemberModel copyWith({  int? id,
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
  String? profileImage,
  String? role,
  String? refferCode,
  String? underRefferCode,
  String? membershipCardNo,
  String? createdAt,
  String? updatedAt,
  int? committeeId,
  int? executiveCommitteeId,
  String? gender,
  int? unionId,
  String? wardNo,
  int? upaziaId,
  Unit? unit,
  DestinationParty? designationParty,
  DestinationCitizan? designationCitizen,
  Upazila? upazila,
  Union? union,
  Committee? committee,
  ExecutiveCommittee? executiveCommittee,
}) => MemberModel(  id: id ?? _id,
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
  unit: unit ?? _unit,
  designationParty: designationParty ?? _designationParty,
  designationCitizen: designationCitizen ?? _designationCitizen,
  upazila: upazila ?? _upazila,
  union: union ?? _union,
  committee: committee ?? _committee,
  executiveCommittee: executiveCommittee ?? _executiveCommittee,
);
  int? get id => _id;
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
  String? get profileImage => _profileImage;
  String? get role => _role;
  String? get refferCode => _refferCode;
  String? get underRefferCode => _underRefferCode;
  String? get membershipCardNo => _membershipCardNo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get committeeId => _committeeId;
  int? get executiveCommitteeId => _executiveCommitteeId;
  String? get gender => _gender;
  int? get unionId => _unionId;
  String? get wardNo => _wardNo;
  int? get upaziaId => _upaziaId;
  Unit? get unit => _unit;
  DestinationParty? get designationParty => _designationParty;
  DestinationCitizan? get designationCitizen => _designationCitizen;
  Upazila? get upazila => _upazila;
  Union? get union => _union;
  Committee? get committee => _committee;
  ExecutiveCommittee? get executiveCommittee => _executiveCommittee;

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
    if (_unit != null) {
      map['unit'] = _unit?.toJson();
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
    return map;
  }

}
