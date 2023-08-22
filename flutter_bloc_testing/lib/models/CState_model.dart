import 'cityV0_model.dart';
class CStateModel {
  final String idState;
  final String stateName;
  final String stateCode;
  final List<CityVOModel> cityVO;

  CStateModel({
    required this.idState,
    required this.stateName,
    required this.stateCode,
    required this.cityVO,
  });

  factory CStateModel.fromJson(Map<String, dynamic> json) {
    return CStateModel(
      idState: json['idState'],
      stateName: json['stateName'],
      stateCode: json['stateCode'],
      cityVO: List<CityVOModel>.from(
        json['cityVOList'].map((cityJson) => CityVOModel.fromJson(cityJson)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idState': idState,
      'stateName': stateName,
      'stateCode': stateCode,
      'cityVOList': cityVO.map((city) => city.toJson()).toList(),
    };
  }
}
