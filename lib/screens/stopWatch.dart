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
  bool isRunning = false, resetButtonVisiblity = false;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  Text(
                    ":",
                    style: appText(AppColor.textColor, 72),
                  ),
                  //seconds
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
                  Text(
                    ":",
                    style: appText(AppColor.textColor, 72),
                  ),
                  //miliSeconds
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
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.buttonBGColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
                    resetButtonVisiblity?const SizedBox(
                      width: 50,
                    ):const SizedBox.shrink(),
                resetButtonVisiblity
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.buttonBGColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            shadowColor: Colors.black87,
                            minimumSize: Size(Get.width * .3, 50),
                            maximumSize: Size(Get.width * .3, 50)),
                        onPressed: () {
                          _resetTimer();
                        },
                        child: Text(
                          'RESET',
                          style: appText(AppColor.textColor, 18),
                        ))
                    : const SizedBox.shrink()
              ],
            )
          ],
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
    resetButtonVisiblity = checkBool();
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
      resetButtonVisiblity = false;
    });
  }

  bool checkBool() {
    if (intmiliSeconds != 0 || intseconds != 0 || intminutes != 0) {
      return true;
    } else {
      return false;
    }
  }
}
