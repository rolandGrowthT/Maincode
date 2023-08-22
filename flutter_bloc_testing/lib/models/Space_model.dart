class SpaceModel {
  final String spaceId;
  final String propertyName;
  final String spaceTitle;
  final String spaceDescription;
  final double spaceRating;
  final int spacePrice;
  final List<String> spaceImages;
  final int cindex;

  const SpaceModel({
    required this.spaceId,
    required this.propertyName,
    required this.spaceTitle,
    required this.spaceDescription,
    required this.spaceRating,
    required this.spacePrice,
    required this.spaceImages,
    this.cindex = 0,
  });
  static const empty = SpaceModel(
      spaceId: '',
      propertyName: '',
      spaceTitle: '',
      spaceDescription: '',
      spaceRating: 0.0,
      spacePrice: 0,
      spaceImages: []);
  factory SpaceModel.fromJson(Map<String, dynamic> json) {
    return SpaceModel(
      spaceId: json['spaceId'],
      propertyName: json['propertyName'],
      spaceTitle: json['spaceTitle'],
      spaceDescription: json['spaceDescription'],
      spaceRating: json['spaceRating'].toDouble(),
      spacePrice: json['spacePrice'],
      spaceImages: List<String>.from(json['spaceImages']),
    );
  }
}
