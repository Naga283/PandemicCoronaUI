import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pandamic/model/constants/constants.dart';
class PreventScreen extends StatelessWidget {
  final String img;
  final String title;
  final String des;
  const PreventScreen({ Key? key, required this.img, required this.title, required this.des }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:10.0),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
         Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(img),
              Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(child: Text(des,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                    )),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assests/icons/forward.svg"),
                    ),
      ]),
    )
    )
    ]
    ));
  }
}