class SliderModel {
  int id;
  String title;
  String imageUrl;
  String createdAt;
  String updatedAt;

  SliderModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to convert JSON data into SliderModel object
  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
