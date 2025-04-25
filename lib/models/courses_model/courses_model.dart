import 'package:vida/models/courses_model/availability_model.dart';

class CoursesModel {
  final String title;
  final String description;
  final String type;
  final String imageUrl;
  final double price;
  final String instructorEmail;
  final int maxParticipants;
  final String notes;
  final bool isActive;
  final int availabilityId;
  final int id;
  final AvailabilityModel availability;

  CoursesModel({
    required this.title,
    required this.description,
    required this.type,
    required this.imageUrl,
    required this.price,
    required this.instructorEmail,
    required this.maxParticipants,
    required this.notes,
    required this.isActive,
    required this.availabilityId,
    required this.id,
    required this.availability,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    return CoursesModel(
      title: json['title'],
      description: json['description'],
      type: json['type'],
      imageUrl: json['imageURL'],
      // ⚠️ case-sensitive key
      price: (json['price'] as num).toDouble(),
      instructorEmail: json['instructorEmail'],
      maxParticipants: json['maxParticipants'],
      notes: json['notes'],
      isActive: json['isActive'],
      availabilityId: json['availabilityId'],
      id: json['id'],
      availability: AvailabilityModel.fromJson(json['availability']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'type': type,
      'imageURL': imageUrl,
      'price': price,
      'instructorEmail': instructorEmail,
      'maxParticipants': maxParticipants,
      'notes': notes,
      'isActive': isActive,
      'availabilityId': availabilityId,
      'id': id,
      'availability': availability.toJson(),
    };
  }
}
