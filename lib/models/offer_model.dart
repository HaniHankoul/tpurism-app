class OfferModel {
  final int offerId;
  final String title;
  final String description;
  final int discountValue;
  final int tripId;

  OfferModel({
    required this.offerId,
    required this.title,
    required this.description,
    required this.discountValue,
    required this.tripId,
  });

  // Change this to accept Map<String, dynamic> instead of String
  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      offerId: json['offerId'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      discountValue: json['discountValue'] as int,
      tripId: json['tripId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'offerId': offerId,
      'title': title,
      'description': description,
      'discountValue': discountValue,
      'tripId': tripId,
    };
  }
}