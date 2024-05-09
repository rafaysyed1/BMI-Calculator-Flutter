import 'package:flutter/material.dart';
import 'package:bmi_calculator/CustomWidgets/button.dart';
String gender = "";
bool selectMaleCardColor = false;
bool selectFemaleCardColor = false;
double weightValue = 10.0;
double ageValue = 8.0;

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  Color initalCardColor = const Color(0xff1d1e33);
  Color selectedCardColor = Color(0xffFF0000);
  double heightValue = 160.0;

  void updateHeightValueHandler(double value) {
    setState(() {
      heightValue = value;
    });
  }
   void updateWeightIncrementValueHandler() {
    setState(() {
      weightValue++;
    });
  }
   void updateWeightDecrementValueHandler() {
    setState(() {
      weightValue--;
    });
  }
    void updateAgeIncrementValueHandler() {
    setState(() {
      ageValue++;
    });
  }
   void updateAgeDecrementValueHandler() {
    setState(() {
      ageValue--;
    });
  }
  


  

  void updateGender(String selectedGender) {
    setState(() {
      gender = selectedGender;
      if (gender == 'male') {
        selectMaleCardColor = true;
        selectFemaleCardColor = false;
      } else if (gender == "female") {
        selectFemaleCardColor = true;
        selectMaleCardColor = false;
      }

      print(gender);
    });
  }

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
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                selectGender(
                  context: context,
                  name: 'Male',
                  clr:
                      selectMaleCardColor ? selectedCardColor : initalCardColor,
                  myIcon: Icons.male,
                  borderRadius: BorderRadius.circular(10.0),
                  methodCall: () => updateGender('male'),
                ),
                selectGender(
                  context: context,
                  name: 'Female',
                  clr: selectFemaleCardColor
                      ? selectedCardColor
                      : initalCardColor,
                  myIcon: Icons.female,
                  borderRadius: BorderRadius.circular(10.0),
                  methodCall: () => updateGender('female'),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xff1d1e33)),
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.only(top: 20.0,bottom: 20.0) ,
                  child: const Text(
                    'HEIGHT',
                    style: TextStyle(color: Colors.grey),
                  ) ,)
                   ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${heightValue.toInt()}',
                        style: const TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text('cm')
                      ),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.only(top: 20.0,bottom: 20.0) ,
                  child : Slider(
                    value: heightValue,
                    min: 140.0,
                    max: 240.0,
                    thumbColor: Colors.yellow,
                    onChanged: (double value) =>
                        {updateHeightValueHandler(value)},
                  )
                )
],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0,bottom: 10.0),
              child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                counterCard(context: context, title: 'WEIGHT', value: weightValue,incrementMethodCall: updateWeightIncrementValueHandler,decrementMethodCall: updateWeightDecrementValueHandler ),
                counterCard(context: context, title: 'AGE', value: ageValue , incrementMethodCall: updateAgeIncrementValueHandler,decrementMethodCall: updateAgeDecrementValueHandler)
              ],
            ),
            ),
            Row(
              children: [
                MyButton(buttonText: 'CALCULATE',age: ageValue, height: heightValue,gender: gender, weight: weightValue,)
              ],
            )
],
        ),
      ),
    );
  }
}

Widget selectGender({
  required BuildContext context,
  required String name,
  required Color clr,
  required IconData myIcon,
  required BorderRadius borderRadius,
  required VoidCallback methodCall
}) {
  return GestureDetector(
    onTap: methodCall,
    child: SizedBox(
      height: 190.0,
      width: 180.0,
      child: Card(
        color: clr,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              myIcon,
              size: 50.0,
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget counterCard ({
  required BuildContext context,
  required String title,
  required double value,
   required VoidCallback incrementMethodCall,
  required VoidCallback decrementMethodCall,
}){
  return SizedBox(
    height: 190.0,
    width: 180.0,
    child: Card(
    color: const Color(0xff1d1e33),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)
    ),
   child: Column(
    children: [
      Container(
        padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
        child: Text(title,style: const TextStyle(color: Colors.grey),),
      ),
       Text('${value.toInt()}',style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
               color:  Colors.lightGreen,
            ),
            child: GestureDetector(
              onTap: decrementMethodCall,
              child: const Icon(
                Icons.remove,
                size: 30.0,
                ),
            ),
           
            
          ),
          Container(
            padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
            decoration: const ShapeDecoration(shape: CircleBorder(),
            
            color: Colors.lightGreen,
            ),
            child : GestureDetector(
              onTap: incrementMethodCall,
              child: const Icon(
               Icons.add,
               size: 30.0,
              ) ,
            )
            ,
          )
          
        ],
       )
    ],
   ),
  ) ,
  ); 
  

}
