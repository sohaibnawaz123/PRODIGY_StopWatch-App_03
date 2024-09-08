// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolioapp/utils/colors.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  String minutes = "00", seconds = "00", miliSeconds = "00";
  int intminutes = 0, intseconds = 0, intmiliSeconds = 0;
  late Timer _timer;
  bool isRunning = false;
  List laps = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: AppColor.appbarBGColor,
        backgroundColor: AppColor.appbarBGColor,
        title: Text(
          "STOP WATCH",
          style: appHeading(AppColor.bgColor, 32),
        ),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      width: Get.width - 20,
                      height: Get.height * 0.2,
                      decoration: BoxDecoration(
                          color: AppColor.appbarBGColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 5),
                                color: Colors.black54,
                                blurRadius: 10)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //minutes
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Minutes",
                                style: appText(AppColor.textColor, 16),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: Get.width / 5,
                                height: Get.width / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(1, 5),
                                        color: Colors.black45,
                                        blurRadius: 10)
                                  ],
                                  color: Colors.white,
                                ),
                                child: Text(
                                  minutes,
                                  style: appText(AppColor.buttonBGColor, 48),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            ":",
                            style: appText(AppColor.textColor, 72),
                          ),
                          //seconds
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Seconds",
                                style: appText(AppColor.textColor, 16),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: Get.width / 5,
                                height: Get.width / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(1, 5),
                                        color: Colors.black45,
                                        blurRadius: 10)
                                  ],
                                  color: Colors.white,
                                ),
                                child: Text(
                                  seconds,
                                  style: appText(AppColor.buttonBGColor, 48),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            ":",
                            style: appText(AppColor.textColor, 72),
                          ),
                          //miliSeconds
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Milli-Sec",
                                style: appText(AppColor.textColor, 16),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: Get.width / 5,
                                height: Get.width / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(1, 5),
                                        color: Colors.black45,
                                        blurRadius: 10)
                                  ],
                                  color: Colors.white,
                                ),
                                child: Text(
                                  miliSeconds,
                                  style: appText(AppColor.buttonBGColor, 48),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.buttonBGColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 10,
                                shadowColor: Colors.black87,
                                minimumSize: Size(Get.width * .5, 50),
                                maximumSize: Size(Get.width * .5, 50)),
                            onPressed: () {
                              isRunning ? pauseTimer() : startTimer();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                isRunning
                                    ? Text(
                                        'Stop',
                                        style: appText(AppColor.textColor, 24),
                                      )
                                    : Text('Start',
                                        style: appText(AppColor.textColor, 24)),
                                isRunning
                                    ? Icon(
                                        Icons.pause_circle,
                                        size: 30,
                                        color: AppColor.textColor,
                                      )
                                    : Icon(
                                        Icons.play_arrow_rounded,
                                        size: 30,
                                        color: AppColor.textColor,
                                      )
                              ],
                            )),
                        const SizedBox(
                          width: 50,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.buttonBGColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 10,
                                shadowColor: Colors.black87,
                                minimumSize: Size(Get.width * .3, 50),
                                maximumSize: Size(Get.width * .3, 50)),
                            onPressed: () {
                              isRunning ? _addLaps() : _resetTimer();
                            },
                            child: isRunning
                                ? Text(
                                    'LAPS',
                                    style: appText(AppColor.textColor, 18),
                                  )
                                : Text('RESET',
                                    style: appText(AppColor.textColor, 18)))
                      ],
                    ),
                  ],
                ),
              ),

              //Laps Box
              laps.isNotEmpty?
              Container(
                width: Get.width-20,
                height: Get.height * 0.5,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: AppColor.buttonBGColor),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'TIME LAPS',
                        style: appHeading(AppColor.buttonBGColor, 24,
                            fontweight: FontWeight.w600),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: laps.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Laps ${index + 1}",
                                        style: appText(AppColor.textColor2, 18),
                                      ),
                                      Text(
                                        laps[index],
                                        style: appText(AppColor.textColor2, 18),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 10,
                                    thickness: 1,
                                    color: AppColor.headingColor,
                                  )
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ):const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    isRunning = true;
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      _startmiliSeconds();
    });
  }

  void pauseTimer() {
    _timer.cancel();
    isRunning = false;
  }

  void _startmiliSeconds() {
    setState(() {
      if (intmiliSeconds < 99) {
        intmiliSeconds++;
        miliSeconds = intmiliSeconds.toString();
        if (miliSeconds.length == 1) {
          miliSeconds = '0$miliSeconds';
        }
      } else {
        _startseconds();
      }
    });
  }

  void _startseconds() {
    setState(() {
      if (intseconds < 59) {
        intmiliSeconds = 0;
        miliSeconds = '00';
        intseconds++;
        seconds = intseconds.toString();
        if (seconds.length == 1) {
          seconds = '0$seconds';
        }
      } else {
        _startHour();
      }
    });
  }

  void _startHour() {
    setState(() {
      intseconds = 0;
      seconds = '00';
      intminutes++;
      minutes = intminutes.toString();
      if (minutes.length == 1) {
        minutes = '0$minutes';
      }
    });
  }

  void _resetTimer() {
    _timer.cancel();
    setState(() {
      miliSeconds = "00";
      seconds = "00";
      minutes = "00";
      intmiliSeconds = 0;
      intseconds = 0;
      intminutes = 0;
      laps.clear();
    });
  }

  bool checkBool() {
    if (intmiliSeconds != 0 || intseconds != 0 || intminutes != 0) {
      return true;
    } else {
      return false;
    }
  }

  void _addLaps() {
    String lap = "$minutes:$seconds:$miliSeconds";
    setState(() {
      laps.add(lap);
    });
  }
}
