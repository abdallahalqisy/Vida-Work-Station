// fetch courses from api

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vida/models/courses_model/courses_model.dart';
import 'package:vida/services/constant/api_uri.dart';

class CourseServices {
  Future<List<CoursesModel>> fetchCourses() async {
    try {
      final response = await Dio().get('$baseUrl/Courses');

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CoursesModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load courses: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch courses: $e');
    }
  }

  // Reservation Courses to api
  Future<void> reserveCourse(int courseId, String userId) async {
    try {
      final response = await Dio().post('$baseUrl/Course/course-reservation');

      if (response.statusCode == 200) {
        log('Course reserved successfully');
      } else {
        throw Exception('Failed to reserve course: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to reserve course: $e');
    }
  }
}
