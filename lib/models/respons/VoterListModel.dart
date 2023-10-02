/// voterLists : {"current_page":1,"data":[{"id":1,"name":"test","father_husband":"tet","mother":"ttt","date_of_birth":"2023-10-01","mobile_number":"65784365782","nid":"1221421","address":"dsfdsf","designation_citizen_id":6,"profile_image":null,"gender":"Male","upazia_id":1,"union_id":1,"ward_no":"1","voter_kendros_names_id":null,"post_code":2342,"voter_type":"old","created_at":"2023-09-30T19:32:28.000000Z","updated_at":"2023-09-30T19:40:52.000000Z","voter_kendo_name":"sfsddssdfds","voter_kendo_number":"342","designation_citizen":{"id":6,"name":"শিক্ষক","created_at":"2023-08-06T18:26:04.000000Z","updated_at":"2023-08-10T20:30:28.000000Z"},"upazila":{"id":1,"name":"Bagmara","created_at":"2023-08-07T00:28:19.000000Z","updated_at":"2023-08-07T00:28:19.000000Z"},"union":{"id":1,"name":"গোবিন্দপাড়া ইউনিয়ন","upazila_id":1,"created_at":"2023-08-06T18:29:15.000000Z","updated_at":"2023-08-10T20:55:54.000000Z"},"voter_kendros_name":null},{"id":2,"name":"tt","father_husband":"tt","mother":"tt","date_of_birth":"2023-10-01","mobile_number":"45435","nid":"3443534","address":"43443534sdfdssd","designation_citizen_id":6,"profile_image":null,"gender":"Male","upazia_id":1,"union_id":11,"ward_no":"5","voter_kendros_names_id":null,"post_code":535,"voter_type":"new","created_at":"2023-09-30T19:38:53.000000Z","updated_at":"2023-09-30T19:38:53.000000Z","voter_kendo_name":"dfgfdgf","voter_kendo_number":"34543","designation_citizen":{"id":6,"name":"শিক্ষক","created_at":"2023-08-06T18:26:04.000000Z","updated_at":"2023-08-10T20:30:28.000000Z"},"upazila":{"id":1,"name":"Bagmara","created_at":"2023-08-07T00:28:19.000000Z","updated_at":"2023-08-07T00:28:19.000000Z"},"union":{"id":11,"name":"গনিপুর ইউনিয়ন","upazila_id":1,"created_at":"2023-08-10T20:57:39.000000Z","updated_at":"2023-08-10T20:57:39.000000Z"},"voter_kendros_name":null}],"first_page_url":"http://192.168.0.117:8000/api/voter-lists?page=1","from":1,"last_page":1,"last_page_url":"http://192.168.0.117:8000/api/voter-lists?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://192.168.0.117:8000/api/voter-lists?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"http://192.168.0.117:8000/api/voter-lists","per_page":10,"prev_page_url":null,"to":2,"total":2}
/// message : "Voter lists fetched successfully"
/// status : 200

class VoterListModel {
  VoterListModel({
      VoterLists? voterLists, 
      String? message, 
      num? status,}){
    _voterLists = voterLists;
    _message = message;
    _status = status;
}

  VoterListModel.fromJson(dynamic json) {
    _voterLists = json['voterLists'];
    _message = json['message'];
    _status = json['status'];
  }
  VoterLists? _voterLists;
  String? _message;
  num? _status;
VoterListModel copyWith({  VoterLists? voterLists,
  String? message,
  num? status,
}) => VoterListModel(  voterLists: voterLists ?? _voterLists,
  message: message ?? _message,
  status: status ?? _status,
);
  VoterLists? get voterLists => _voterLists;
  String? get message => _message;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['voterLists'] = _voterLists;
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}

/// current_page : 1
/// data : [{"id":1,"name":"test","father_husband":"tet","mother":"ttt","date_of_birth":"2023-10-01","mobile_number":"65784365782","nid":"1221421","address":"dsfdsf","designation_citizen_id":6,"profile_image":null,"gender":"Male","upazia_id":1,"union_id":1,"ward_no":"1","voter_kendros_names_id":null,"post_code":2342,"voter_type":"old","created_at":"2023-09-30T19:32:28.000000Z","updated_at":"2023-09-30T19:40:52.000000Z","voter_kendo_name":"sfsddssdfds","voter_kendo_number":"342","designation_citizen":{"id":6,"name":"শিক্ষক","created_at":"2023-08-06T18:26:04.000000Z","updated_at":"2023-08-10T20:30:28.000000Z"},"upazila":{"id":1,"name":"Bagmara","created_at":"2023-08-07T00:28:19.000000Z","updated_at":"2023-08-07T00:28:19.000000Z"},"union":{"id":1,"name":"গোবিন্দপাড়া ইউনিয়ন","upazila_id":1,"created_at":"2023-08-06T18:29:15.000000Z","updated_at":"2023-08-10T20:55:54.000000Z"},"voter_kendros_name":null},{"id":2,"name":"tt","father_husband":"tt","mother":"tt","date_of_birth":"2023-10-01","mobile_number":"45435","nid":"3443534","address":"43443534sdfdssd","designation_citizen_id":6,"profile_image":null,"gender":"Male","upazia_id":1,"union_id":11,"ward_no":"5","voter_kendros_names_id":null,"post_code":535,"voter_type":"new","created_at":"2023-09-30T19:38:53.000000Z","updated_at":"2023-09-30T19:38:53.000000Z","voter_kendo_name":"dfgfdgf","voter_kendo_number":"34543","designation_citizen":{"id":6,"name":"শিক্ষক","created_at":"2023-08-06T18:26:04.000000Z","updated_at":"2023-08-10T20:30:28.000000Z"},"upazila":{"id":1,"name":"Bagmara","created_at":"2023-08-07T00:28:19.000000Z","updated_at":"2023-08-07T00:28:19.000000Z"},"union":{"id":11,"name":"গনিপুর ইউনিয়ন","upazila_id":1,"created_at":"2023-08-10T20:57:39.000000Z","updated_at":"2023-08-10T20:57:39.000000Z"},"voter_kendros_name":null}]
/// first_page_url : "http://192.168.0.117:8000/api/voter-lists?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "http://192.168.0.117:8000/api/voter-lists?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://192.168.0.117:8000/api/voter-lists?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "http://192.168.0.117:8000/api/voter-lists"
/// per_page : 10
/// prev_page_url : null
/// to : 2
/// total : 2

class VoterLists {
  VoterLists({
      num? currentPage, 
      List<VoterListModelData>? data,
      String? firstPageUrl, 
      num? from, 
      num? lastPage, 
      String? lastPageUrl, 
      List<Links>? links, 
      dynamic nextPageUrl, 
      String? path, 
      num? perPage, 
      dynamic prevPageUrl, 
      num? to, 
      num? total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  VoterLists.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(VoterListModelData.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  num? _currentPage;
  List<VoterListModelData>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  dynamic _nextPageUrl;
  String? _path;
  num? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;
VoterLists copyWith({  num? currentPage,
  List<VoterListModelData>? data,
  String? firstPageUrl,
  num? from,
  num? lastPage,
  String? lastPageUrl,
  List<Links>? links,
  dynamic nextPageUrl,
  String? path,
  num? perPage,
  dynamic prevPageUrl,
  num? to,
  num? total,
}) => VoterLists(  currentPage: currentPage ?? _currentPage,
  data: data ?? _data,
  firstPageUrl: firstPageUrl ?? _firstPageUrl,
  from: from ?? _from,
  lastPage: lastPage ?? _lastPage,
  lastPageUrl: lastPageUrl ?? _lastPageUrl,
  links: links ?? _links,
  nextPageUrl: nextPageUrl ?? _nextPageUrl,
  path: path ?? _path,
  perPage: perPage ?? _perPage,
  prevPageUrl: prevPageUrl ?? _prevPageUrl,
  to: to ?? _to,
  total: total ?? _total,
);
  num? get currentPage => _currentPage;
  List<VoterListModelData>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  num? get from => _from;
  num? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  List<Links>? get links => _links;
  dynamic get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  num? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  num? get to => _to;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

/// url : null
/// label : "&laquo; Previous"
/// active : false

class Links {
  Links({
      dynamic url, 
      String? label, 
      bool? active,}){
    _url = url;
    _label = label;
    _active = active;
}

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String? _label;
  bool? _active;
Links copyWith({  dynamic url,
  String? label,
  bool? active,
}) => Links(  url: url ?? _url,
  label: label ?? _label,
  active: active ?? _active,
);
  dynamic get url => _url;
  String? get label => _label;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }

}

/// id : 1
/// name : "test"
/// father_husband : "tet"
/// mother : "ttt"
/// date_of_birth : "2023-10-01"
/// mobile_number : "65784365782"
/// nid : "1221421"
/// address : "dsfdsf"
/// designation_citizen_id : 6
/// profile_image : null
/// gender : "Male"
/// upazia_id : 1
/// union_id : 1
/// ward_no : "1"
/// voter_kendros_names_id : null
/// post_code : 2342
/// voter_type : "old"
/// created_at : "2023-09-30T19:32:28.000000Z"
/// updated_at : "2023-09-30T19:40:52.000000Z"
/// voter_kendo_name : "sfsddssdfds"
/// voter_kendo_number : "342"
/// designation_citizen : {"id":6,"name":"শিক্ষক","created_at":"2023-08-06T18:26:04.000000Z","updated_at":"2023-08-10T20:30:28.000000Z"}
/// upazila : {"id":1,"name":"Bagmara","created_at":"2023-08-07T00:28:19.000000Z","updated_at":"2023-08-07T00:28:19.000000Z"}
/// union : {"id":1,"name":"গোবিন্দপাড়া ইউনিয়ন","upazila_id":1,"created_at":"2023-08-06T18:29:15.000000Z","updated_at":"2023-08-10T20:55:54.000000Z"}
/// voter_kendros_name : null

class VoterListModelData {
  VoterListModelData({
      num? id, 
      String? name, 
      String? fatherHusband, 
      String? mother, 
      String? dateOfBirth, 
      String? mobileNumber, 
      String? nid, 
      String? address, 
      num? designationCitizenId, 
      dynamic profileImage, 
      String? gender, 
      num? upaziaId, 
      num? unionId, 
      String? wardNo, 
      dynamic voterKendrosNamesId, 
      num? postCode, 
      String? voterType, 
      String? createdAt, 
      String? updatedAt, 
      String? voterKendoName, 
      String? voterKendoNumber, 
      DesignationCitizen? designationCitizen, 
      Upazila? upazila, 
      Union? union, 
      dynamic voterKendrosName,}){
    _id = id;
    _name = name;
    _fatherHusband = fatherHusband;
    _mother = mother;
    _dateOfBirth = dateOfBirth;
    _mobileNumber = mobileNumber;
    _nid = nid;
    _address = address;
    _designationCitizenId = designationCitizenId;
    _profileImage = profileImage;
    _gender = gender;
    _upaziaId = upaziaId;
    _unionId = unionId;
    _wardNo = wardNo;
    _voterKendrosNamesId = voterKendrosNamesId;
    _postCode = postCode;
    _voterType = voterType;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _voterKendoName = voterKendoName;
    _voterKendoNumber = voterKendoNumber;
    _designationCitizen = designationCitizen;
    _upazila = upazila;
    _union = union;
    _voterKendrosName = voterKendrosName;
}

  VoterListModelData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _fatherHusband = json['father_husband'];
    _mother = json['mother'];
    _dateOfBirth = json['date_of_birth'];
    _mobileNumber = json['mobile_number'];
    _nid = json['nid'];
    _address = json['address'];
    _designationCitizenId = json['designation_citizen_id'];
    _profileImage = json['profile_image'];
    _gender = json['gender'];
    _upaziaId = json['upazia_id'];
    _unionId = json['union_id'];
    _wardNo = json['ward_no'];
    _voterKendrosNamesId = json['voter_kendros_names_id'];
    _postCode = json['post_code'];
    _voterType = json['voter_type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _voterKendoName = json['voter_kendo_name'];
    _voterKendoNumber = json['voter_kendo_number'];
    _designationCitizen = json['designation_citizen'] != null ? DesignationCitizen.fromJson(json['designation_citizen']) : null;
    _upazila = json['upazila'] != null ? Upazila.fromJson(json['upazila']) : null;
    _union = json['union'] != null ? Union.fromJson(json['union']) : null;
    _voterKendrosName = json['voter_kendros_name'];
  }
  num? _id;
  String? _name;
  String? _fatherHusband;
  String? _mother;
  String? _dateOfBirth;
  String? _mobileNumber;
  String? _nid;
  String? _address;
  num? _designationCitizenId;
  dynamic _profileImage;
  String? _gender;
  num? _upaziaId;
  num? _unionId;
  String? _wardNo;
  dynamic _voterKendrosNamesId;
  num? _postCode;
  String? _voterType;
  String? _createdAt;
  String? _updatedAt;
  String? _voterKendoName;
  String? _voterKendoNumber;
  DesignationCitizen? _designationCitizen;
  Upazila? _upazila;
  Union? _union;
  dynamic _voterKendrosName;
VoterListModelData copyWith({  num? id,
  String? name,
  String? fatherHusband,
  String? mother,
  String? dateOfBirth,
  String? mobileNumber,
  String? nid,
  String? address,
  num? designationCitizenId,
  dynamic profileImage,
  String? gender,
  num? upaziaId,
  num? unionId,
  String? wardNo,
  dynamic voterKendrosNamesId,
  num? postCode,
  String? voterType,
  String? createdAt,
  String? updatedAt,
  String? voterKendoName,
  String? voterKendoNumber,
  DesignationCitizen? designationCitizen,
  Upazila? upazila,
  Union? union,
  dynamic voterKendrosName,
}) => VoterListModelData(  id: id ?? _id,
  name: name ?? _name,
  fatherHusband: fatherHusband ?? _fatherHusband,
  mother: mother ?? _mother,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  mobileNumber: mobileNumber ?? _mobileNumber,
  nid: nid ?? _nid,
  address: address ?? _address,
  designationCitizenId: designationCitizenId ?? _designationCitizenId,
  profileImage: profileImage ?? _profileImage,
  gender: gender ?? _gender,
  upaziaId: upaziaId ?? _upaziaId,
  unionId: unionId ?? _unionId,
  wardNo: wardNo ?? _wardNo,
  voterKendrosNamesId: voterKendrosNamesId ?? _voterKendrosNamesId,
  postCode: postCode ?? _postCode,
  voterType: voterType ?? _voterType,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  voterKendoName: voterKendoName ?? _voterKendoName,
  voterKendoNumber: voterKendoNumber ?? _voterKendoNumber,
  designationCitizen: designationCitizen ?? _designationCitizen,
  upazila: upazila ?? _upazila,
  union: union ?? _union,
  voterKendrosName: voterKendrosName ?? _voterKendrosName,
);
  num? get id => _id;
  String? get name => _name;
  String? get fatherHusband => _fatherHusband;
  String? get mother => _mother;
  String? get dateOfBirth => _dateOfBirth;
  String? get mobileNumber => _mobileNumber;
  String? get nid => _nid;
  String? get address => _address;
  num? get designationCitizenId => _designationCitizenId;
  dynamic get profileImage => _profileImage;
  String? get gender => _gender;
  num? get upaziaId => _upaziaId;
  num? get unionId => _unionId;
  String? get wardNo => _wardNo;
  dynamic get voterKendrosNamesId => _voterKendrosNamesId;
  num? get postCode => _postCode;
  String? get voterType => _voterType;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get voterKendoName => _voterKendoName;
  String? get voterKendoNumber => _voterKendoNumber;
  DesignationCitizen? get designationCitizen => _designationCitizen;
  Upazila? get upazila => _upazila;
  Union? get union => _union;
  dynamic get voterKendrosName => _voterKendrosName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['father_husband'] = _fatherHusband;
    map['mother'] = _mother;
    map['date_of_birth'] = _dateOfBirth;
    map['mobile_number'] = _mobileNumber;
    map['nid'] = _nid;
    map['address'] = _address;
    map['designation_citizen_id'] = _designationCitizenId;
    map['profile_image'] = _profileImage;
    map['gender'] = _gender;
    map['upazia_id'] = _upaziaId;
    map['union_id'] = _unionId;
    map['ward_no'] = _wardNo;
    map['voter_kendros_names_id'] = _voterKendrosNamesId;
    map['post_code'] = _postCode;
    map['voter_type'] = _voterType;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['voter_kendo_name'] = _voterKendoName;
    map['voter_kendo_number'] = _voterKendoNumber;
    if (_designationCitizen != null) {
      map['designation_citizen'] = _designationCitizen?.toJson();
    }
    if (_upazila != null) {
      map['upazila'] = _upazila?.toJson();
    }
    if (_union != null) {
      map['union'] = _union?.toJson();
    }
    map['voter_kendros_name'] = _voterKendrosName;
    return map;
  }

}

/// id : 1
/// name : "গোবিন্দপাড়া ইউনিয়ন"
/// upazila_id : 1
/// created_at : "2023-08-06T18:29:15.000000Z"
/// updated_at : "2023-08-10T20:55:54.000000Z"

class Union {
  Union({
      num? id, 
      String? name, 
      num? upazilaId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _upazilaId = upazilaId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Union.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _upazilaId = json['upazila_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  num? _upazilaId;
  String? _createdAt;
  String? _updatedAt;
Union copyWith({  num? id,
  String? name,
  num? upazilaId,
  String? createdAt,
  String? updatedAt,
}) => Union(  id: id ?? _id,
  name: name ?? _name,
  upazilaId: upazilaId ?? _upazilaId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  num? get upazilaId => _upazilaId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['upazila_id'] = _upazilaId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// name : "Bagmara"
/// created_at : "2023-08-07T00:28:19.000000Z"
/// updated_at : "2023-08-07T00:28:19.000000Z"

class Upazila {
  Upazila({
      num? id, 
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Upazila.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
Upazila copyWith({  num? id,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => Upazila(  id: id ?? _id,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 6
/// name : "শিক্ষক"
/// created_at : "2023-08-06T18:26:04.000000Z"
/// updated_at : "2023-08-10T20:30:28.000000Z"

class DesignationCitizen {
  DesignationCitizen({
      num? id, 
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  DesignationCitizen.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
DesignationCitizen copyWith({  num? id,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => DesignationCitizen(  id: id ?? _id,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}