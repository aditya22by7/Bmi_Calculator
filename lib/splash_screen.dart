import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class splashscreen extends StatefulWidget{
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  var _width = 200.0;
  var _height = 200.0;

 @override
  void initState() { // we put initState for the splash screen timer.
    super.initState();

    Timer(Duration(seconds: 6), (){

      Navigator.pushReplacement( // we use pushreplacement because we want splacescreen only when app opens.
       context,
          MaterialPageRoute(builder:(context) => MyHomePage(),));

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                  onTap: (){
                    setState(() {
                      _width=100.0;
                      _height=200.0;
                    });
                  },

                  child: AnimatedContainer(
                  child:Image.asset('assets/images/bmi.png',width: 200,
                    height: 200,) ,
                    height: _height ,
                      width: _width,
                      curve: Curves.bounceOut,
                      duration:Duration(seconds: 3)
                  ),
                             ),
           ]

            ),
      )
    );

  }
}