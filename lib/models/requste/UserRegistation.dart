class UserRegistation {
  UserRegistation({
    String? name,
    String? fatherHusband,
    String? mother,
    String? dateOfBirth,
    String? mobileNumber,
    String? email,
    String? password,
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
    int? wardNo,
    int? upaziaId,

  }) {
    _name = name;
    _fatherHusband = fatherHusband;
    _mother = mother;
    _dateOfBirth = dateOfBirth;
    _mobileNumber = mobileNumber;
    _email = email;
    _password = password;
    _nid = nid;
    _address = address;
    _unitId = unitId;
    _designationPartyId = designationPartyId;
    _designationCitizenId = designationCitizenId;
    _image = image;
    _role = role;
    _underRefferCode = underRefferCode;
    _membershipCardNo = membershipCardNo;
    _committeeId = committeeId;
    _executiveCommitteeId = executiveCommitteeId;
    _gender = gender;
    _unionId = unionId;
    _wardNo = wardNo;
    _upaziaId = upaziaId;
    _unit = unit;
    _designationParty = designationParty;
    _designationCitizen = designationCitizen;
  }

  UserRegistation.fromJson(dynamic json) {
    _name = json['name'];
    _fatherHusband = json['father_husband'];
    _mother = json['mother'];
    _dateOfBirth = json['date_of_birth'];
    _mobileNumber = json['mobile_number'];
    _email = json['email'];
    _password = json['password'];
    _nid = json['nid'];
    _address = json['address'];
    _unitId = json['unit_id'];
    _designationPartyId = json['designation_party_id'];
    _designationCitizenId = json['designation_citizen_id'];
    _image = json['image'];
    _role = json['role'];
    _underRefferCode = json['under_reffer_code'];
    _membershipCardNo = json['membership_card_no'];
    _committeeId = json['committee_id'];
    _executiveCommitteeId = json['executive_committee_id'];
    _gender = json['gender'];
    _unionId = json['union_id'];
    _wardNo = json['ward_no'];
    _upaziaId = json['upazia_id'];
    _unit = json['unit'];
    _designationParty = json['designation_party'];
    _designationCitizen = json['designation_citizen'];
  }

  String? _name;
  String? _fatherHusband;
  String? _mother;
  String? _dateOfBirth;
  String? _mobileNumber;
  String? _email;
  String? _password;
  String? _nid;
  String? _address;
  int? _unitId;
  int? _designationPartyId;
  int? _designationCitizenId;
  String? _image;
  String? _role;
  String? _underRefferCode;
  String? _membershipCardNo;
  int? _committeeId;
  int? _executiveCommitteeId;
  String? _gender;
  int? _unionId;
  int? _wardNo;
  int? _upaziaId;
  int? _unit;
  int? _designationParty;
  int? _designationCitizen;

  UserRegistation copyWith({
    String? name,
    String? fatherHusband,
    String? mother,
    String? dateOfBirth,
    String? mobileNumber,
    String? email,
    String? password,
    String? nid,
    String? address,
    int? unitId,
    int? designationPartyId,
    int? designationCitizenId,
    String? image,
    String? role,
    String? underRefferCode,
    String? membershipCardNo,
    int? committeeId,
    int? executiveCommitteeId,
    String? gender,
    int? unionId,
    int? wardNo,
    int? upaziaId,
    int? unit,
    int? designationParty,
    int? designationCitizen,
  }) =>
      UserRegistation(
        name: name ?? _name,
        fatherHusband: fatherHusband ?? _fatherHusband,
        mother: mother ?? _mother,
        dateOfBirth: dateOfBirth ?? _dateOfBirth,
        mobileNumber: mobileNumber ?? _mobileNumber,
        email: email ?? _email,
        password: password ?? _password,
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
      );

  String? get name => _name;

  String? get fatherHusband => _fatherHusband;

  String? get mother => _mother;

  String? get dateOfBirth => _dateOfBirth;

  String? get mobileNumber => _mobileNumber;

  String? get email => _email;
  String? get password => _password;

  String? get nid => _nid;

  String? get address => _address;

  int? get unitId => _unitId;

  int? get designationPartyId => _designationPartyId;

  int? get designationCitizenId => _designationCitizenId;

  String? get image => _image;

  String? get role => _role;

  String? get underRefferCode => _underRefferCode;

  String? get membershipCardNo => _membershipCardNo;

  int? get committeeId => _committeeId;

  int? get executiveCommitteeId => _executiveCommitteeId;

  String? get gender => _gender;

  int? get unionId => _unionId;

  int? get wardNo => _wardNo;

  int? get upaziaId => _upaziaId;

  int? get unit => _unit;

  int? get designationParty => _designationParty;

  int? get designationCitizen => _designationCitizen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['father_husband'] = _fatherHusband;
    map['mother'] = _mother;
    map['date_of_birth'] = _dateOfBirth;
    map['mobile_number'] = _mobileNumber;
    map['email'] = _email;
    map['password'] = _password;
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
    return map;
  }
}
