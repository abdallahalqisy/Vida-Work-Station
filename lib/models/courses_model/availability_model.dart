class AvailabilityModel {
  final int dayOfWeek;
  final String openTime;
  final String closeTime;
  final bool isActive;
  final int id;

  AvailabilityModel({
    required this.dayOfWeek,
    required this.openTime,
    required this.closeTime,
    required this.isActive,
    required this.id,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) {
    return AvailabilityModel(
      dayOfWeek: json['dayOfWeek'],
      openTime: json['openTime'],
      closeTime: json['closeTime'],
      isActive: json['isActive'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dayOfWeek': dayOfWeek,
      'openTime': openTime,
      'closeTime': closeTime,
      'isActive': isActive,
      'id': id,
    };
  }
}
