import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:itrags/BusinessLogic/Audio/stats.dart';
import 'package:itrags/Data/AudioRepoistory/Repoisitory.dart';

import '../../Data/API/AudioApi.dart';
import '../../Data/Model/AudioModel.dart';
import '../../Presentaion/Home.dart';
import '../../Presentaion/MoreOptions.dart';
import '../../l10n/app_localizations.dart';

class TaskChallenge extends Cubit<MyState> {
  final Audio repository; // Use the correct type
  late QuranAudioModel audioData;

  TaskChallenge({required this.repository}) : super(InitialState());

  Future<void> fetchAudioData() async {
    try {
      emit(LoadingData());
      audioData = await repository.getAudio();
      print( audioData.audioUrl);// Store the fetched data
      emit(LoadedData());
    } catch (error) {
      emit(DataError('Failed to fetch audio: $error'));
    }
  }
  List<bool> isLikedList = [false, false, false]; // Initialize with false values for each item

  void toggleLike(int index) {
    isLikedList[index] = !isLikedList[index];
    emit(LikeToggled());
  }

  int currentIndex=0;

  List<BottomNavigationBarItem> getBottomItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled,),
        label: '${AppLocalizations.of(context)!.home} ',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.more_horiz_rounded,),
        label: '${AppLocalizations.of(context)!.more} ',
      ),
    ];
  }


  List<Widget>Screens = [
    DataFetchingPage(),
    MoreOptions(),
    // SettingScreen()
  ];

  void changeBottom(int index){
    currentIndex=index;
    emit(BottomNav());
  }





}