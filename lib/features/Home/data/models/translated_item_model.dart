class TranslatedItemModel {
  final String translationImage;
  final String translationText;
  final String date;
  final String translationType;

  TranslatedItemModel({
    required this.translationImage,
    required this.translationText,
    required this.date,
    required this.translationType,
  });

  factory TranslatedItemModel.fromJson(Map<String, dynamic> json) {
    return TranslatedItemModel(
      translationImage: json['translationImage'] ?? '',
      translationText: json['translationText'] ?? '',
      date: json['date'] ?? '',
      translationType: json['translationType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'translationImage': translationImage,
      'translationText': translationText,
      'date': date,
      'translationType': translationType,
    };
  }
}
