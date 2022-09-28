import 'dart:convert';

class Senaryo {
  final int senaryoNumber;
  final String senaryoText;
  final String imageUrl;
  final String longText;
  final String shortText;
  final String category;

  Senaryo(this.imageUrl, this.senaryoNumber, this.senaryoText, this.longText,
      this.shortText, this.category);

  Senaryo.fromJson(Map<String, dynamic> json)
      : senaryoNumber = json['senaryoNumber'],
        senaryoText = json['senaryoText'],
        imageUrl = json['imageUrl'],
        longText = json["long-text"],
        shortText = json["short-text"],
        category = json["category"];

  Map<String, dynamic> toJson() => {
        'senaryoNumber': senaryoNumber,
        'senaryoText': senaryoText,
        'imageUrl': imageUrl,
        "longText": longText,
        "shortText": shortText,
        "category": category
      };
}
