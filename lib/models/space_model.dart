class SpaceModel {
  final int id;
  final String name;
  final String description;
  final String instructorEmail;
  final String type;
  final String imageUrl;
  final double hourlyRate;
  final int capacity;
  final bool requiresApproval;
  final bool isActive;

  SpaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.instructorEmail,
    required this.type,
    required this.imageUrl,
    required this.hourlyRate,
    required this.capacity,
    required this.requiresApproval,
    required this.isActive,
  });

  factory SpaceModel.fromJson(Map<String, dynamic> json) {
    return SpaceModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      instructorEmail: json['instructorEmail'],
      type: json['type'],
      imageUrl: json['imageUrl'],
      hourlyRate: json['hourlyRate'],
      capacity: json['capacity'],
      requiresApproval: json['requiresApproval'],
      isActive: json['isActive'],
    );
  }
}
