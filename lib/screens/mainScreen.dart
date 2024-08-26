// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:portfolioapp/utils/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(title: Text('Portfolio App',style: appHeading(AppColor.textColor, 28),),backgroundColor: AppColor.appbarBGColor,),
    );
  }
}