import 'dart:convert';

class Senaryo {
  final int senaryoNumber;
  final String senaryoText;
  final String imageUrl;
  final String longText;
  final String shortText;
  final String category;
  final List<dynamic> tip1;
  final List<dynamic> tip2;

  Senaryo(this.imageUrl, this.senaryoNumber, this.senaryoText, this.longText,
      this.shortText, this.category, this.tip1, this.tip2);

  // List<String> tags = Senaryo.fromJson(Map<String, dynamic> json).tip1 != null ? List.from(tagsJson) : null;

  Senaryo.fromJson(Map<String, dynamic> json)
      : senaryoNumber = json['senaryoNumber'],
        senaryoText = json['senaryoText'],
        imageUrl = json['imageUrl'],
        longText = json['long-text'],
        shortText = json['short-text'],
        category = json['category'],
        tip1 =((json['tip1'] ?? []) as List),
        tip2 =((json['tip2'] ?? []) as List);

  Map<String, dynamic> toJson() => {
        'senaryoNumber': senaryoNumber,
        'senaryoText': senaryoText,
        'imageUrl': imageUrl,
        'longText': longText,
        'shortText': shortText,
        'category': category,
        'tip1': tip1,
        'tip2': tip2
      };
}
