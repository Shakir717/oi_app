class CardDetails {
  int cardId;
  String cardName;
  String issuingBank;

  CardDetails({this.cardId, this.cardName, this.issuingBank});

  CardDetails.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    cardName = json['card_name'];
    issuingBank = json['issuing_bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card_id'] = cardId;
    data['card_name'] = cardName;
    data['issuing_bank'] = issuingBank;
    return data;
  }
}