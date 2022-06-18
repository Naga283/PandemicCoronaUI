import 'package:flutter/material.dart';
import 'package:pandamic/view/homeScreens/preventScreen.dart';
import 'package:pandamic/view/homeScreens/symptons.dart';

import '../../model/constants/constants.dart';
import 'header.dart';
class InfoScreen extends StatefulWidget {
  final double offset;
  const InfoScreen({ Key? key, required this.offset }) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _controller = ScrollController();
  double offset =0;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() { });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  void onscroll(){
    setState(() {
      offset = (_controller.hasClients) ? _controller.offset : 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Header(
                image: "assests/icons/coronadr.svg",
                textTop: "Get to know",
                textBottom: "About Covid-19.",
                offset: widget.offset,
              ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 20),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                        "Symptoms",
                        style: kTitleTextstyle,
                      ),
                      SizedBox(height: 20),
                    
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Symptoms(img: "assests/images/headache.png", titl: "Headache", isActive: true,),
                            Symptoms(img: "assests/images/caugh.png", titl: "Caugh", isActive: false,),
                            Symptoms(img: "assests/images/fever.png", titl: "Fever", isActive: false,),
                          ],
                        ),
                      ),   SizedBox(height: 20),
                  Text("Prevention", style: kTitleTextstyle),
                  PreventScreen(img: "assests/images/wear_mask.png", title: 'Wear Face Mask', des: 'Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks',),
                   PreventScreen(
                    des:
                        "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                    img: "assests/images/wash_hands.png",
                    title: "Wash your hands",
                  ),
                  SizedBox(height: 50),

                ],
               ),
             )
          ],
        ),
      ),
      
    );
  }
}