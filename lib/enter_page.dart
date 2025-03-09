
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Enterpage extends StatefulWidget {




  var namefromhome;

  Enterpage(this.namefromhome);

  @override
  State<Enterpage> createState() => _EnterpageState();
}

class _EnterpageState extends State<Enterpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EnterScreen'),
      ),

      body: Container(
        width: double.infinity,
        color: Colors.lightGreenAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {


                  Navigator.pop(context);

                },child: Text('Back')),


          ],
        ),
      ),
    );
  }
}