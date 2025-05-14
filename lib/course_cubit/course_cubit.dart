import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:vida/models/courses_model/courses_model.dart';
import 'package:vida/services/constant/api_uri.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final dio = Dio();

  CourseCubit() : super(CourseInitial());

  Future<List<CoursesModel>> fetchCourses() async {
    emit(CourseLoadingState());
    try {
      final response = await dio.get('$baseUrl/Course');

      if (response.statusCode == 200) {
        emit(CourseLoadedState());
        return (response.data as List)
            .map((e) => CoursesModel.fromJson(e))
            .toList();
      } else {
        emit(
          CourseErrorState(
            message: 'Failed to load courses: ${response.statusCode}',
          ),
        );
        throw Exception('Failed to load courses: ${response.statusCode}');
      }
    } catch (e) {
      emit(CourseErrorState(message: 'Failed to fetch courses: $e'));
      throw Exception('Failed to fetch courses: $e');
    }
  }
}
