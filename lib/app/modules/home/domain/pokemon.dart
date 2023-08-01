import 'dart:convert';

class Pokemon {
  final String id;
  final List<dynamic> types;
  final String imageUrl;
  final String imageUrlHiRes;
  final String name;
  final CardType cardType;

  Pokemon({
    required this.id,
    required this.types,
    required this.imageUrl,
    required this.imageUrlHiRes,
    required this.name,
    required this.cardType,
  });

  String uniqueId() {
    return cardType.toString() + id;
  }

  String toJson(CardType cardType) {
    Map<String, dynamic> json = _fromMapJson(cardType);
    return jsonEncode(json);
  }

  Map<String, dynamic> _fromMapJson(CardType customCardType) {
    return {
      'id': id,
      'types': types,
      'imageUrl': imageUrl,
      'imageUrlHiRes': imageUrlHiRes,
      'name': name,
      'cardType': customCardType.toString(),
    };
  }

  static Pokemon fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return fromMapJson(map);
  }

  static Pokemon fromMapJson(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'],
      imageUrl: map['imageUrl'],
      imageUrlHiRes: map['imageUrlHiRes'],
      name: map['name'],
      types: map['types'],
      cardType: CardTypeHelper.fromString(map['cardType']),
    );
  }
}

enum CardType { FAVORITE, PUBLIC, MY_CARD }

class CardTypeHelper {
  static fromString(String cardType) {
    if (cardType == null) {
      return CardType.PUBLIC;
    }
    for (var type in CardType.values) {
      if (type.toString().contains(cardType)) {
        return type;
      }
    }
    return CardType.PUBLIC;
  }
}
