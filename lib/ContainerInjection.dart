import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:itrags/BusinessLogic/Audio/cubit.dart';
import 'package:itrags/Data/API/AudioApi.dart';
import 'package:itrags/Data/AudioRepoistory/Repoisitory.dart';


final sl =GetIt.instance;
Future<void> init()async{

//Cubit
  sl.registerFactory(() => TaskChallenge(repository: sl<Audio>()));



// Repost
  sl.registerLazySingleton<Audio>(() => AudioApi(dio: sl()));





// External
  sl.registerLazySingleton(() => Dio());


}