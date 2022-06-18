import 'package:flutter/material.dart';

import '../../model/constants/constants.dart';
class CounterWid extends StatefulWidget {
  final Color color;
  final int number;
  final String title;
  CounterWid({Key? key, required this.color, required this.number, required this.title}) : super(key: key);

  @override
  State<CounterWid> createState() => _CounterWidState();
}

class _CounterWidState extends State<CounterWid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
       
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: widget.color,
                width: 2,
              ),
            ),
          ),
          ),
          SizedBox(height: 20,),
          Text( "${widget.number}",
          style: TextStyle(
            fontSize: 40,
            color: widget.color,
          ),),
          Text(widget.title, style: kSubTextStyle),
          
        
      ],
    );
  }
}