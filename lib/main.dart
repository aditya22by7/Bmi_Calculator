
import 'package:flutter/material.dart';
import 'package:store_and_retrieve_data/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splashscreen(),);
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result ="";
  var bgcolor = Colors.tealAccent;





  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('HEALTH',style: TextStyle(fontFamily:'GoodFont',fontSize: 30),),
        ),


        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(

                colors:[ Color(0xfffad0c4),
                  Color(0xffffd1ff),
                ]),
          ),

          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text('Body Mass Index',style: TextStyle(
                        fontSize: 30,fontWeight:FontWeight.bold,
                        fontFamily: 'NewFont',color: Colors.deepPurpleAccent.shade100
                    ),),

                    SizedBox(
                      height: 60,
                    ),

                    TextField(
                      controller: wtController ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(55)),
                        label: Text('Enter Your Weight Here'),
                        prefixIcon: Icon(Icons.line_weight),prefixIconColor: Colors.amber,
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    SizedBox(
                        height:15
                    ),

                    TextField(
                      controller: ftController ,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(55)),
                          label: Text('Enter Your Height In Feet'),
                          prefixIcon: Icon(Icons.height),prefixIconColor: Colors.orange
                      ),

                      keyboardType: TextInputType.number,
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    TextField(
                      controller: inController ,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(55)),
                          label: Text('Enter Your Height In Inch '),
                          prefixIcon: Icon(Icons.height),prefixIconColor: Colors.lightGreenAccent
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    ElevatedButton(


                        onPressed: (){




                          var wt = wtController.text.toString();
                          var ft = ftController.text.toString();
                          var In = inController.text.toString();


                          if (wt != '' && ft != '' && In != '') {
                            //BMI Calculation

                            var iwt = int.parse(wt);
                            var ift = int.parse(ft);
                            var iIn = int.parse(In);


                            var tIn = (ift * 12) + iIn;

                            var tCm = tIn * 2.54;

                            var tM = tCm / 100;

                            var bmi = iwt / (tM * tM);

                            var msg = "";

                            if (bmi > 25) {
                              msg = "You Are OverWeight!!";
                              bgcolor = Colors.deepOrangeAccent;
                            } else if (bmi < 18) {
                              msg = "You Are UnderWeight!!";
                              bgcolor = Colors.yellowAccent;
                            } else {
                              msg = "You Are Healthy!!";
                              bgcolor = Colors.lightGreenAccent;
                            }
                            setState(() {
                              result = "$msg\n Your BMI is: ${bmi.toStringAsFixed(2)}";
                            });


                          } else {
                            setState(() {
                              result = 'Please fill all the required blanks!!';
                            });
                          }

                        },

                        child: Text('Calculate',)),

                    SizedBox(
                        height:10
                    ),

                    Text(result , style: TextStyle(fontSize: 25,color: Colors.deepPurple),)
                  ],
                ),
              ),
            ),
          ),
        )


    );
  }
}
