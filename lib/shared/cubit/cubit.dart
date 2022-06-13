import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Constant/constant.dart';
import 'package:muslim/models/details_model.dart';
import 'package:muslim/models/main_titles_model.dart';
import 'package:muslim/shared/cubit/states.dart';
import 'package:muslim/shared/remote/dio/dio_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(InitState());
  static AppCubit get(context)=>BlocProvider.of(context);
  MainTitlesModel? mainTitlesModel;
  DetailsModel? detailsModel;
  int counter=0;
  int totalCounter=0;
  int numberPage=0;

  void getMainTitlesData(){
    emit(GetMainTitlesDataLoadingState());

    DioHelper.getData(url: "http://www.hisnmuslim.com/api/ar/husn_ar.json").then((value) {

      mainTitlesModel=MainTitlesModel.fromJson(value.data);
      print(mainTitlesModel!.arabic![0].title);
      emit(GetMainTitlesDataSuccessState());
    }).catchError((error){
      print("**************");
      print(error);

      emit(GetMainTitlesDataErrorState());
    });
  }
  void getZekrData(
      int id
      ){
    emit(ZekrDetailsDataLoadingState());

    DioHelper.getData(url: "http://www.hisnmuslim.com/api/ar/$id.json").then((value) {
      detailsModel=DetailsModel.fromJson(value.data);

      for(int i=0;i<=detailsModel!.zekr!.length;i++)
        {
          iconsList.add(Icons.play_circle_outline_outlined);
        }
      print(detailsModel!.zekr![0].arabicText);
      emit(ZekrDetailsDataSuccessState());
    }).catchError((error){
      print(error);
      emit(ZekrDetailsDataErrorState());
    });
  }
  final player = AudioCache(fixedPlayer: AudioPlayer());
  String audio = 'assets/sound/sound.mp3';

  void startAudio(String x) async{
    await player.play(x);
  }
  AudioPlayer audioPlayer = AudioPlayer();
  play(String c) async {
    int result = await audioPlayer.play(c);
    if (result == 1) {
      // success
    }
  }
  void stopZekr() {
    audioPlayer.stop();
  }
  void stop() {
    player.fixedPlayer!.stop();
  }
  void changeButton(String x,int v){
    if(oldIndex==v)
      {
        isClicked=!isClicked;

      }else{
      iconsList[oldIndex]=Icons.play_circle_outline_outlined;
      if(isClicked==false)
        {
          isClicked=true;
        }
    }
    if(isClicked)
      {
        oldIndex=v;
        iconsList[v]=Icons.stop_circle_outlined;
        play(x);
        emit(ChangeIconState());

      }
    else
      {
        iconsList[v]=Icons.play_circle_outline_outlined;
        stopZekr();
        emit(ChangeIconState());

      }
  }

  void increase(){
    counter++;
    if(counter > 33){
      totalCounter++;
      counter=0;
    }
    emit(IncreaseCounterState());
  }
  void zeroCounter(){
    counter=0;
    emit(IncreaseCounterState());
  }
  List quranModel=[];

  Future<void> readQuranJson() async {
     String response = await rootBundle.loadString('assets/quran_data/surah.json');
     quranModel = await json.decode(response);
     print("${quranModel[0]}");

     emit(GetQuranDetailsState());
  }

  void changeNumberPage(int index){

    numberPage=index;
    emit(ChangeNumberPageState());
  }
}