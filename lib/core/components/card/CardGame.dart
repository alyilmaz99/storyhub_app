class CardGame {
  final String name;
  final bool isFront;
  final String imageUrl;

  CardGame(this.name, this.isFront, this.imageUrl);

  CardGame.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        isFront = json['isFront'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'isFront': isFront,
        'imageUrl': imageUrl,
      };
}
