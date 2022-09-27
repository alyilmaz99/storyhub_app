class CardGame {
  final int cardNumber;
  final bool isFront;
  final String imageUrl;

  CardGame(this.cardNumber, this.isFront, this.imageUrl);

  CardGame.fromJson(Map<String, dynamic> json)
      : cardNumber = json['cardNumber'],
        isFront = json['isFront'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'cardNumber': cardNumber,
        'isFront': isFront,
        'imageUrl': imageUrl,
      };
}
