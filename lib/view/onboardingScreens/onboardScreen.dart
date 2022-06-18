import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pandamic/model/onboardingmodel/onboardmodel.dart';

import '../homeScreens/homescreen.dart';
class OnboardScreenPage extends StatefulWidget {
  const OnboardScreenPage({ Key? key }) : super(key: key);

  @override
  State<OnboardScreenPage> createState() => _OnboardScreenPageState();
}

class _OnboardScreenPageState extends State<OnboardScreenPage> {
  final pageController = PageController();
  int currentIndex = 0;
  List colors = [Color(0xffDAD3C8), Color(0xffFFE5DE), Color(0xffDCF6E6)];

  AnimatedContainer _builddots({int? index}) {
    return AnimatedContainer(duration: Duration(milliseconds: 200,
  ),
   decoration: BoxDecoration(
  color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),),
        margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: currentIndex == index ? 20 : 10,
  );}
  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    final hei = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colors[currentIndex],
      body: Column(
        children: [
  Expanded(
    flex: 3,
    child: PageView.builder(
      controller: pageController,
      onPageChanged: (value)=>setState(() {
        currentIndex = value;
      }),
      itemCount: onboardScreen.length,
      itemBuilder: (context, index) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
  children: [
    LottieBuilder.network(
      
      onboardScreen[index].img,height:(hei/100) * 35,),
  // Image.asset(onboardScreen[index].img),
  SizedBox(
                            height: (hei >= 840) ? 60 : 30,
                          ),
  Text(onboardScreen[index].mainText,style: TextStyle( 
    fontFamily: "popins",
    fontWeight: FontWeight.w600,
                                  fontSize: (wid <= 550) ? 30 : 35,
  ),
  textAlign: TextAlign.center,
  ),
  SizedBox(height: 15,),
  Flexible(
    child: Text(onboardScreen[index].subText,textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.w300,
                                    fontSize: (wid <= 550) ? 17 : 25,
    ),
    ),
  )

  ],
          ),
        ),
      );
    
    }),
  ),
  Expanded(
    flex: 1,
    child: Column(
      children: [
         Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardScreen.length,
                      (int index) => _builddots(index: index),
                    ),
                  ),
                  currentIndex+1 == onboardScreen.length?Padding(
                          padding: const EdgeInsets.all(30),
                          child: ElevatedButton(
                            onPressed: () {
                             Navigator.of(context).push( MaterialPageRoute(builder: (context)=>const HomeScreen()));
                            },
                            child: Text("START"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: (wid <= 550)
                                  ? EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 20)
                                  : EdgeInsets.symmetric(
                                      horizontal: wid * 0.2, vertical: 25),
                              textStyle:
                                  TextStyle(fontSize: (wid <= 550) ? 13 : 17),
                            ),
                          ),
                        ):
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){
                pageController.jumpToPage(2);
              }, child: Text("SKIP",style:TextStyle(color: Colors.black)),
               style: TextButton.styleFrom(
                                  elevation: 0,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: (wid <= 550) ? 13 : 17,
                                  ),
                                ),
              ),
              ElevatedButton(child: Text("NEXT"),onPressed: (){
              pageController.nextPage(duration: Duration(milliseconds: 200),  curve: Curves.easeIn,);
  },
  
   style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  elevation: 0,
                                  padding: (wid <= 550)
                                      ? EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20)
                                      : EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 25),
                                  textStyle: TextStyle(
                                      fontSize: (wid <= 550) ? 13 : 17),
                                ),
  ),
            ],
          ),
        ),
      ],
    ))
        ],
      ),
    );
  }
}