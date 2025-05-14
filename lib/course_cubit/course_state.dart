part of 'course_cubit.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoadingState extends CourseState {}

class CourseLoadedState extends CourseState {}

class CourseErrorState extends CourseState {
  final String message;

  CourseErrorState({required this.message});
}
