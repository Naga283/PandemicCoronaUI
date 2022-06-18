import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../model/constants/constants.dart';
class Symptoms extends StatelessWidget {
  final String img;
  final String titl;
   final bool isActive;
  const Symptoms({ Key? key, required this.img, required this.titl,  required this.isActive }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child:Column(
        children: [
          Image.asset(img,height: 90,),
          Text(titl,style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      )

    );
  }
}