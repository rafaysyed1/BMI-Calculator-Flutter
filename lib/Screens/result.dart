import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  double bmiValue;
  String result;
  String advice;

  Result({
    Key? key,
    required this.bmiValue,
    required this.result,
    required this.advice,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator-Rafay-1374",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "Your Result",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child : Expanded(child:  Card(
              color: const Color(0xff1d1e33),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 40.0,bottom: 40.0),
                    child: Text(
                      widget.result,
                      style: TextStyle(color: Colors.lightGreen,fontSize: 20.0),
                    ) ,),
                   
                    Padding(padding: const EdgeInsets.only(top: 30.0,bottom: 30.0),
                    child: Text(
                      widget.bmiValue.toStringAsFixed(1),
                      style: TextStyle(fontSize: 90.0,fontWeight: FontWeight.bold),
                    ) ,),
                    
                    Padding(padding: const EdgeInsets.only(top:40.0,right: 10.0,bottom: 40.0,left: 20.0),
                    child: Text(
                      widget.advice,
                      style: TextStyle(color: Colors.white,fontSize: 20.0),
                  
                    ),),
                    // SizedBox(height: 50.0,)
                  ],
                ),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF0000),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),

                  ),
                                    ),
              ),
              child: Text(
                'RE-CALCULATE',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
