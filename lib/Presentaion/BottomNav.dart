
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itrags/BusinessLogic/Audio/cubit.dart';
import 'package:itrags/BusinessLogic/Audio/stats.dart';

class BottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskChallenge,MyState>(
      listener: (context,state){},
      builder: (context,state){
        var taskChallengeCubit = BlocProvider.of<TaskChallenge>(context);
        return Scaffold(
          appBar:AppBar(),



          bottomNavigationBar: BottomNavigationBar(items:taskChallengeCubit.getBottomItems(context),
              currentIndex: taskChallengeCubit.currentIndex,
              onTap: (index){
                taskChallengeCubit.changeBottom(index);
              }),
          body: taskChallengeCubit.Screens[taskChallengeCubit.currentIndex],
        );

      },


    );
  }
}
