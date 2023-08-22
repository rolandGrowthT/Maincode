import 'dart:convert';
import 'package:flutter_bloc_testing/models/Property_model.dart';
import 'package:http/http.dart' as http;


class PropertyServices {
  Future<List<PropertyModel>> getAllAvailableProperties() async {
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:31535/otonomus/inventory/api/v1/spaces/available_spaces"));
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'] as List;
      final finalResponse =
          result.map((map) => PropertyModel.fromJson(map)).toList();
      return finalResponse;
    } catch (e) {
      print('Error, No available properties with available spaces');
      return [];
    }
  }
  int getlength(PropertyModel p) {
    try {
      return p.availableSpaces.length - 1;
    } catch (e) {
      return 0;
    }
  }}