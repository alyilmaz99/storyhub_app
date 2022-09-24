class Senaryo {
  final int senaryoNumber;
  final String senaryoText;
  final String imageUrl;

  Senaryo(this.imageUrl, this.senaryoNumber, this.senaryoText);

  Senaryo.fromJson(Map<String, dynamic> json)
      : senaryoNumber = json['senaryoNumber'],
        senaryoText = json['senaryoText'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'senaryoNumber': senaryoNumber,
        'senaryoText': senaryoText,
        'imageUrl': imageUrl,
      };
}
