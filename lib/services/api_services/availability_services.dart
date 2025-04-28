// fetch availability from api

import 'package:dio/dio.dart';
import 'package:vida/models/courses_model/availability_model.dart';
import 'package:vida/services/constant/api_uri.dart';

class AvailabilityServices {
  final Dio dio = Dio();

  Future<List<AvailabilityModel>> fetchAvailability() async {
    try {
      final response = await dio.get('$baseUrl/Availability');

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => AvailabilityModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load availability: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch availability: $e');
    }
  }
}
