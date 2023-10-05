import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/Network/CacheHelper.dart';
import 'ModeStats.dart';

class Modecubit extends Cubit<ModeStats> {
  Modecubit() :super(InitStates());
  static Modecubit get(context) => BlocProvider.of(context);



  bool isArabic = false;


  void changeAppLanguage({String? languageCode}) {
    if (languageCode != null) {
      // Set the language code directly
      isArabic = (languageCode == 'ar');
      CacheHelper.putString(key: 'languageCode', value: languageCode).then((value) {

        emit(AppChangeLanguageStats());
      });
    } else {
      // Toggle between "en" and "ar"
      isArabic = !isArabic;
      // Determine the language code based on the boolean value
      String languageCode = isArabic ? 'ar' : 'en';
      CacheHelper.putString(key: 'languageCode', value: languageCode).then((value) {

        emit(AppChangeLanguageStats());
      });
    }
  }

  bool isDark=false;
  void changeAppMode({ bool ?fromShared}){
    if(fromShared != null) {
      isDark= fromShared;
      emit(AppChangeModeStats());

    } else {
      isDark= !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeStats());

      });}}






}