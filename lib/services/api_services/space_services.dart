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

  // Reservation Spaces to api
  Future<void> reserveSpace({
    required int spaceId,
    required String userId,
    required int availabilityId,
  }) async {
    try {
      final response = await Dio().post('$baseUrl/Space/space-reservation');

      if (response.statusCode == 200) {
        print('Space reserved successfully');
      } else {
        throw Exception('Failed to reserve space: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to reserve space: $e');
    }
  }
}
