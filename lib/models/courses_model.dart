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
  final Map<String, dynamic> availability;

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
      imageUrl: json['imageUrl'],
      price: json['price'],
      instructorEmail: json['instructorEmail'],
      maxParticipants: json['maxParticipants'],
      notes: json['notes'],
      isActive: json['isActive'],
      availabilityId: json['availabilityId'],
      id: json['id'],
      availability: json['availability'],
    );
  }
}
