class MainTitlesModel {
  List<Arabic>? arabic;

  MainTitlesModel({this.arabic});

  MainTitlesModel.fromJson(Map<String, dynamic> json) {
    if (json['العربية'] != null) {
      arabic = <Arabic>[];
      json['العربية'].forEach((v) {
        arabic!.add( Arabic.fromJson(v));
      });
    }
  }


}

class Arabic {
  int? id;
  String? title;
  String? audioUrl;
  String? text;

  Arabic.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    title = json['TITLE'];
    audioUrl = json['AUDIO_URL'];
    text = json['TEXT'];
  }

}
