import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itrags/BusinessLogic/Audio/cubit.dart';
import 'package:itrags/l10n/app_localizations.dart';

import 'BusinessLogic/Options/CubitMode.dart';
import 'BusinessLogic/Options/ModeStats.dart';
import 'Containerinjection.dart'as di;

import 'Presentaion/BottomNav.dart';

import 'core/Network/CacheHelper.dart';
import 'core/Network/Network_info.dart';
import 'core/Shared/Theme.dart';


void main (
    )async
{

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  await di.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  String? languageCode = CacheHelper.getString(key: 'languageCode');
  runApp(MyApp(isDark,languageCode));

}



class MyApp extends StatelessWidget
{
  final bool? isDark;
  final String? languageCode; // Update the parameter type

  MyApp(this.isDark,this.languageCode);

  @override
  Widget build(BuildContext context)
  {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (context , child) {
          return  MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => di.sl<TaskChallenge> ()..fetchAudioData()),
                BlocProvider( create: (BuildContext context)=>
                Modecubit()..changeAppMode(fromShared: isDark)..changeAppLanguage(languageCode: languageCode), // Pass the languageCode
                ),


              ],
              child:  BlocConsumer<Modecubit,ModeStats>(
              listener: (context, state) {},
                builder: (context, state) {
                    return MaterialApp(
                     debugShowCheckedModeBanner:   false,
                        locale: Modecubit.get(context).isArabic ? const Locale('ar') : const Locale('en'),

                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        localeResolutionCallback: localeCallBack,

                        theme:  Modecubit.get(context).isDark?lightTheme:darkTheme,
                  home: BottomNavBar()

              );

        }
        )
        );

  });
  }}
