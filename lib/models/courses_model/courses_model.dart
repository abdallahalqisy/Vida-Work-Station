import 'package:vida/models/courses_model/availability_model.dart';

class CoursesModel {
  final String? title;
  final String? description;
  final String? type;
  final String? imageUrl;
  final double? price;
  final String? instructorEmail;
  final int? maxParticipants;
  final String? notes;
  final bool? isActive;
  final int? availabilityId;
  final int? id;
  final AvailabilityModel? availability;

  CoursesModel({
    this.title,
    this.description,
    this.type,
    this.imageUrl,
    this.price,
    this.instructorEmail,
    this.maxParticipants,
    this.notes,
    this.isActive,
    this.availabilityId,
    this.id,
    this.availability,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    return CoursesModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      instructorEmail: json['instructorEmail'] ?? '',
      maxParticipants: json['maxParticipants'] ?? 0,
      notes: json['notes'] ?? '',
      isActive: json['isActive'] ?? false,
      availabilityId: json['availabilityId'] ?? 0,
      id: json['id'] ?? 0,
      availability:
          json['availability'] != null
              ? AvailabilityModel.fromJson(json['availability'])
              : AvailabilityModel.empty(),
    );
  }
}
