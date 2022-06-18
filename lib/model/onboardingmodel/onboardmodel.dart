import 'package:flutter/material.dart';
class OnBoardScreens{
  final String img;
  final String mainText;
  final String subText;
  OnBoardScreens({required this.img,required this.mainText,required this.subText});
}
List<OnBoardScreens> onboardScreen=[
  OnBoardScreens(img: "https://assets2.lottiefiles.com/packages/lf20_ucnevewn.json", mainText: "Fight With Corona", subText: "In this application we will check about pandameic situation"),
  OnBoardScreens(img: "https://assets3.lottiefiles.com/private_files/lf30_ed0rdvno.json", mainText: "Wash Your Hand Daily", subText: "Washing your hands is easy, and it’s one of the most effective ways to prevent the spread of germs. Clean hands can help stop germs from spreading from one person to another and in our communities—including your home, workplace, schools, and childcare facilities."),
  OnBoardScreens(img: "https://assets6.lottiefiles.com/packages/lf20_eDM9E4.json", mainText: "Wear Mask", subText: "Masks are an important measure to protect yourself and others. If a person wearing a mask is unknowingly infected with COVID-19, wearing a mask will reduce the chance of them passing the virus on to others"),
 
];