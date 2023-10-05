import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itrags/BusinessLogic/Audio/cubit.dart';

import '../BusinessLogic/Audio/stats.dart';
import '../l10n/app_localizations.dart';

class AudioPlayerPage extends StatefulWidget {
  // Define required parameters for the widget


  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final player = AudioPlayer();
  bool isPlaying = false;
  final cacheManager = DefaultCacheManager();

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<TaskChallenge>(context).fetchAudioData();

    player.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.stopped) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  Future<void> toggleAudio() async {
    var audioData =  BlocProvider.of<TaskChallenge>(context).audioData.audioUrl;

    if (isPlaying) {
      await player.pause();
    } else if (player.state == PlayerState.paused) {
      await player.resume();
    } else {
      // Use the DefaultCacheManager to cache the audio file.
      await cacheManager.downloadFile(audioData);
      await player.play(UrlSource(audioData));
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskChallenge, MyState>(
        listener: (context, state) {
      if (state is DataError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed. Please check your Internet.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    },
    builder: (context, state) {

    return Container(
      height: 70.h,
      width: double.infinity,
      child:
      Row(mainAxisAlignment: MainAxisAlignment.start,
        children: [

          if (state is LoadingData) // Show a loading indicator
        CircularProgressIndicator()
      else
          IconButton(
          icon: isPlaying ?  SvgPicture.asset(
            'assets/images/pause.svg',
            width: 30.w,
            height: 30.h,
          ) :  SvgPicture.asset(
            'assets/images/play.svg',
            width: 30.w,
            height: 30.h,
          ),
          onPressed: toggleAudio,
        ),
          SizedBox(width: 10.w,),
          Text(
            isPlaying
                ? AppLocalizations.of(context)!.pauseThis
                : AppLocalizations.of(context)!.playThis,
            style: Theme.of(context).textTheme.subtitle1,
          )

        ]),
    );
  }
    );}}
