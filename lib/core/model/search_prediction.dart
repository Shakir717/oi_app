class SearchPrediction{
  String placeId='';
  String mainText='';
  String secondaryText='';

  SearchPrediction({this.placeId, this.mainText, this.secondaryText});

  SearchPrediction.fromJson(Map<String,dynamic> json){
    placeId=json['place_id'];
    mainText=json['structured_formatting']['main_text'];
    if(json['structured_formatting']['secondary_text'] !=null){
      secondaryText=json['structured_formatting']['secondary_text'];
    }

  }
}