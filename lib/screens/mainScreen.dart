// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolioapp/utils/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,

      appBar: AppBar(title: Text('Portfolio',style: appHeading(AppColor.textColor, 28),),backgroundColor: AppColor.appbarBGColor,),

      body: AnimatedContainer(
        duration: const Duration(seconds: 10),
        width: Get.width
        ,height: Get.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 30.0 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sohaib Nawaz",style: appHeading(AppColor.headingColor,32,decoration: TextDecoration.underline,dcolor: AppColor.headingColor),textAlign: TextAlign.left,),
              SizedBox(height: Get.height*0.01,),
              SizedBox(width: Get.width-20,child: Text("I am a passionate Software Engineer with a knack for learning quickly and adapting to new challenges. My expertise lies in WordPress and Flutter development, where I enjoy building engaging websites and intuitive mobile apps. With a strong foundation in software engineering, I am committed to delivering solutions that are both innovative and user-friendly.",style: appTextRegular(AppColor.headingColor,18,fontweight: FontWeight.w600),textAlign: TextAlign.left,)),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  child: Lottie.asset('assets/images/main.json',height: Get.height*0.35),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}