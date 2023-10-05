import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../l10n/app_localizations.dart';
import 'AudioPage.dart';

class DataFetchingPage extends StatefulWidget {
  @override
  State<DataFetchingPage> createState() => _DataFetchingPageState();
}

class _DataFetchingPageState extends State<DataFetchingPage> {
  List<bool> isLikedList = [false, false, false]; // Initialize with false values


  @override
  Widget build(BuildContext context) {



          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  AppLocalizations.of(context)!.thisApp,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.topLikes,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      height: 185.h,
                      child:  ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          int modified=index+1;
                          return Row(
                            children: [
                              Text(
                                '${AppLocalizations.of(context)!.sampleText} $modified',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isLikedList[index] =
                                    !isLikedList[index]; // Toggle the icon state for the specific item
                                  });
                                },
                                icon: isLikedList[index]
                                    ?SvgPicture.asset(
                          'assets/images/filled.svg',
                          width: 24.0.w,
                          height: 24.0.h,
                          ) // Display Icons.home when the button is pressed
                                    : SvgPicture.asset(
                                  'assets/images/emptylike.svg',
                                  width: 24.0.w,
                                  height: 24.0.h,
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: Colors.black,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      AppLocalizations.of(context)!.topLikes,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 30.h),

                    AudioPlayerPage(),
                  ],
                ),
              ),
            ),
          );

        }
      }
