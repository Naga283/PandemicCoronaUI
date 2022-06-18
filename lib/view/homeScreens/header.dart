// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pandamic/view/homeScreens/info_screen.dart';

import '../../model/constants/constants.dart';
class Header extends StatefulWidget {
  
  final double offset;
  final String image;
  final String textTop;
  final String textBottom;
  const Header({Key? key, required this.offset, required this.image, required this.textTop, required this.textBottom}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F),
              ],
            ),
            image: DecorationImage(
              image: AssetImage("assests/images/virus.png"),
            ),
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InfoScreen(offset: 4.0,)));
            },
            child: SvgPicture.asset("assests/icons/menu.svg")),
             Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: (widget.offset < 0) ? 0 : widget.offset,
                      child: SvgPicture.asset(
                        widget.image,
                        width: 230,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Positioned(
                      top: 20 - widget.offset / 2,
                      left: 150,
                      child: Text(
                        "${widget.textTop} \n${widget.textBottom}",
                        style: KheadingStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
        ],
        ),
      )]
      )
      ),
    );
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height-80);
     path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-80);
     path.lineTo(size.width, 0);
     path.close();

   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
   
  }
  
}