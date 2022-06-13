import 'package:muslim/Constant/constant.dart';

class DetailsModel {
  List<Zekr>? zekr;


  DetailsModel.fromJson(Map<String, dynamic> json) {
    if (json[zekrTitle] != null) {
      zekr = <Zekr>[];
      json[zekrTitle].forEach((v) {
        zekr!.add(Zekr.fromJson(v));
      });
    }
  }


}

class Zekr {
  int? id;
  String? arabicText;
  String? languageTranslation;
  String? translatedText;
  int? repeat;
  String? audio;



  Zekr.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    arabicText = json['ARABIC_TEXT'];
    languageTranslation = json['LANGUAGE_ARABIC_TRANSLATED_TEXT'];
    translatedText = json['TRANSLATED_TEXT'];
    repeat = json['REPEAT'];
    audio = json['AUDIO'];
  }


}
