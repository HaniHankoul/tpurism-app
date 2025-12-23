// lib/models/attraction.dart
class AttractionModel {
  final int attractionId;
  final String attractionName;
  final String description;
  final String location;

  AttractionModel({
    required this.attractionId,
    required this.attractionName,
    required this.description,
    required this.location,
  });

  // Factory constructor to create Attraction from JSON
  factory AttractionModel.fromJson(Map<String, dynamic> json) {
    return AttractionModel(
      attractionId: json['attractionId'] as int,
      attractionName: json['attractionName'] as String,
      description: (json['description'] as String).trim(),
      location: json['location'] as String,
    );
  }

  // Convert Attraction to JSON
  Map<String, dynamic> toJson() {
    return {
      'attractionId': attractionId,
      'attractionName': attractionName,
      'description': description,
      'location': location,
    };
  }

  // Copy with method for immutability
  AttractionModel copyWith({
    int? attractionId,
    String? attractionName,
    String? description,
    String? location,
  }) {
    return AttractionModel(
      attractionId: attractionId ?? this.attractionId,
      attractionName: attractionName ?? this.attractionName,
      description: description ?? this.description,
      location: location ?? this.location,
    );
  }

  @override
  String toString() {
    return 'Attraction{attractionId: $attractionId, attractionName: $attractionName, location: $location}';
  }
}