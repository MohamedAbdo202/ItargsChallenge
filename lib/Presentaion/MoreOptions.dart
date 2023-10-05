import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itrags/l10n/app_localizations.dart';

import '../BusinessLogic/Options/CubitMode.dart';
import '../BusinessLogic/Options/ModeStats.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Modecubit, ModeStats>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                AppLocalizations.of(context)!.more,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text(
                    AppLocalizations.of(context)!.settings,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 30.h),
                  Row(

                    children: [



                      Text(AppLocalizations.of(context)!.darkMode,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),Spacer(),
                      IconButton(onPressed: (){  Modecubit.get(context).changeAppMode();


                      }, icon: Icon(  Modecubit.get(context).isDark ? Icons.dark_mode : Icons.light_mode,
       color:Modecubit.get(context).isDark? Colors.deepPurple:Colors.grey ,))
                  ]),
                  Row(
                    children:[ Text(AppLocalizations.of(context)!.changeLanguage,
                      style: Theme.of(context).textTheme.subtitle1,

                    ),Spacer(),

                      IconButton(onPressed: (){  Modecubit.get(context).changeAppLanguage();}
                          , icon: Icon(Modecubit.get(context).isArabic ? Icons.language : Icons.language
                            ,color:Modecubit.get(context).isArabic? Colors.deepPurple:Colors.grey ,))

                    ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
