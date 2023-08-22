import 'package:flutter_bloc_testing/models/Space_model.dart';

class PropertyModel {
  final String propertyId;
  final String propertyName;
  final List<SpaceModel> availableSpaces;

  const PropertyModel(
      {required this.propertyId,
      required this.propertyName,
      required this.availableSpaces});
  static const empty =
      PropertyModel(propertyId: '', propertyName: '', availableSpaces: []);
  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      propertyId: json['propertyId'],
      propertyName: json['propertyName'],
      availableSpaces: List<SpaceModel>.from(
          json['availableSpaces'].map((space) => SpaceModel.fromJson(space))),
    );
  }
}
