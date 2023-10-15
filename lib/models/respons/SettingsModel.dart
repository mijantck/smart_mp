
class SettingsModel {
  SettingsModel({
      num? id,
      String? appFcmKey, 
      String? apiKey, 
      String? paymentKey, 
      String? smsProviderKey, 
      String? appVersion, 
      String? privacyPolicy, 
      String? termsConditions, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _appFcmKey = appFcmKey;
    _apiKey = apiKey;
    _paymentKey = paymentKey;
    _smsProviderKey = smsProviderKey;
    _appVersion = appVersion;
    _privacyPolicy = privacyPolicy;
    _termsConditions = termsConditions;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  SettingsModel.fromJson(dynamic json) {
    _id = json['id'];
    _appFcmKey = json['app_fcm_key'];
    _apiKey = json['api_key'];
    _paymentKey = json['payment_key'];
    _smsProviderKey = json['sms_provider_key'];
    _appVersion = json['app_version'];
    _privacyPolicy = json['privacy_policy'];
    _termsConditions = json['terms_conditions'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _appFcmKey;
  String? _apiKey;
  String? _paymentKey;
  String? _smsProviderKey;
  String? _appVersion;
  String? _privacyPolicy;
  String? _termsConditions;
  String? _createdAt;
  String? _updatedAt;
SettingsModel copyWith({  num? id,
  String? appFcmKey,
  String? apiKey,
  String? paymentKey,
  String? smsProviderKey,
  String? appVersion,
  String? privacyPolicy,
  String? termsConditions,
  String? createdAt,
  String? updatedAt,
}) => SettingsModel(  id: id ?? _id,
  appFcmKey: appFcmKey ?? _appFcmKey,
  apiKey: apiKey ?? _apiKey,
  paymentKey: paymentKey ?? _paymentKey,
  smsProviderKey: smsProviderKey ?? _smsProviderKey,
  appVersion: appVersion ?? _appVersion,
  privacyPolicy: privacyPolicy ?? _privacyPolicy,
  termsConditions: termsConditions ?? _termsConditions,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get appFcmKey => _appFcmKey;
  String? get apiKey => _apiKey;
  String? get paymentKey => _paymentKey;
  String? get smsProviderKey => _smsProviderKey;
  String? get appVersion => _appVersion;
  String? get privacyPolicy => _privacyPolicy;
  String? get termsConditions => _termsConditions;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['app_fcm_key'] = _appFcmKey;
    map['api_key'] = _apiKey;
    map['payment_key'] = _paymentKey;
    map['sms_provider_key'] = _smsProviderKey;
    map['app_version'] = _appVersion;
    map['privacy_policy'] = _privacyPolicy;
    map['terms_conditions'] = _termsConditions;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}