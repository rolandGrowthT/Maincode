class CityVOModel {
  final String idCity;
  final String cityName;

  CityVOModel({
    required this.idCity,
    required this.cityName,
  });

  factory CityVOModel.fromJson(Map<String, dynamic> json) {
    return CityVOModel(
      idCity: json['idCity'],
      cityName: json['cityName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCity': idCity,
      'cityName': cityName,
    };
  }
}