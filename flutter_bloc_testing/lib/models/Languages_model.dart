class LanguageModel {
  final String idLanguage;
  final String languageCode;
  final String languageDescription;

  LanguageModel({
    required this.idLanguage,
    required this.languageCode,
    required this.languageDescription,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      idLanguage: json['idLanguage'],
      languageCode: json['languageCode'],
      languageDescription: json['languageDescription'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'idLanguage': idLanguage,
      'languageCode': languageCode,
      'languageDescription': languageDescription,
    };
  }
}
