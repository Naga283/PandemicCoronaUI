import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pandamic/model/constants/constants.dart';
import 'package:pandamic/view/homeScreens/counterWid.dart';
import 'package:pandamic/view/homeScreens/header.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = ScrollController();
  double offset =0;
  String dropdownValue = "Indonesia";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() { });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  void onscroll(){
   setState(() {
     offset = (_controller.hasClients)?_controller.offset:0;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: SingleChildScrollView(
  controller: _controller,
   child: Column(
    children: [
      Header(
        textTop: 'All you need', textBottom: 'is stay at home.', 
        offset: offset, 
        image: 'assests/icons/Drcorona.svg',),
        Container(
           height: 60,
              width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              
              color: Color(0xFFE5E5E5),
            )
          ),
          child: Row(
            children: [
            SvgPicture.asset("assests/icons/maps-and-flags.svg"),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("assests/icons/dropdown.svg"),
                      value: dropdownValue,
                      items: [
                         'Indonesia',
                        'Bangladesh',
                        'United States',
                        'Japan'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()
                      , onChanged: ( value) { 
                        
                       },)),
            ],
          ),
        ),
        SizedBox(height: 20),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal:10.0),
                         child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           
                            Row(
                              children: [
                               // ignore: prefer_const_constructors
                               RichText(text: TextSpan(
                       
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // ignore: prefer_const_constructors
                                  TextSpan(
                                    text: "Case Updates\n",
                                    style: kTitleTextstyle,
                                  ),
                                  TextSpan(
                                    text: "News Case Updates",
                                    style: TextStyle(
                                      color: kTextLightColor,
                                    )
                                  )
                                ]
                               )),
                               Spacer(),
                               Text(
                        "See details",
                        style: TextStyle(
                          //color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                                           ),
                       
                              ],
                            ),
                       
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(20),
                                           color: Colors.white,
                                           boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                                           ],
                                         ),
                                         child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: <Widget>[
                       CounterWid(
                          color: kInfectedColor,
                          number: 1046,
                          title: "Infected",
                        ),
                        CounterWid(
                          color: kDeathColor,
                          number: 87,
                          title: "Deaths",
                        ),
                        CounterWid(
                          color: kRecovercolor,
                          number: 46,
                          title: "Recovered",
                        ),
                                           ],
                                         ),
                            ),
                            SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Spread of Virus",
                        style: kTitleTextstyle,
                      ),
                      Text(
                        "See details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                   Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assests/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                          ],
                         ),
                       )
    ],
   ),
 ),
    );
  }
}