
class BestCard {
  var cardId;
  String cardName;
  double onePointDollarValue;

  BestCard({this.cardId, this.cardName, this.onePointDollarValue});

  BestCard.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    cardName = json['card_name'];
    onePointDollarValue = json['one_point_dollar_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['card_id'] = cardId;
    data['card_name'] =cardName;
    data['one_point_dollar_value'] = onePointDollarValue;
    return data;
  }
}