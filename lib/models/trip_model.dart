class TripModel {
  final int tripId;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final double price;

  TripModel({
    required this.tripId,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.price,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      tripId: json['tripId'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : DateTime.now(),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'])
          : DateTime.now(),
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'price': price,
    };
  }

  // Helper method to get trip duration in days
  int get durationInDays {
    return endDate.difference(startDate).inDays;
  }

  // Helper method to check if trip is upcoming
  bool get isUpcoming {
    return startDate.isAfter(DateTime.now());
  }

  // Helper method to format price
  String get formattedPrice {
    return '\$${price.toStringAsFixed(2)}';
  }
}