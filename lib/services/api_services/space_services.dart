// fetch space from api

import 'package:dio/dio.dart';
import 'package:vida/models/space_model.dart';
import 'package:vida/services/constant/api_uri.dart';

class SpaceServices {
  Future<List<SpaceModel>> fetchSpace() async {
    try {
      final response = await Dio().get('$baseUrl/Space');

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => SpaceModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load space: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch space: $e');
    }
  }
}
