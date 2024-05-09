import 'package:flutter/material.dart';
import 'package:bmi_calculator/Screens/result.dart';

class BMIInterpretation {
    String result;
   String advice;

  BMIInterpretation(this.result, this.advice);
}

BMIInterpretation interpretBMI(double bmi, double age, String gender) {
  String result;
  String advice;

  if (gender.toLowerCase() == 'male') {
  
    if (age < 2) {
      result = "BMI interpretation not available for infants";
      advice = "Please consult with a pediatrician for further evaluation.";
    } else if (age >= 2 && age <= 19) {
      if (bmi < 5) {
        result = "Underweight";
        advice = "Ensure a balanced diet and regular meals to gain weight.";
      } else if (bmi >= 5 && bmi < 85) {
        result = "Normal";
        advice = "Continue with a healthy lifestyle and regular physical activity.";
      } else if (bmi >= 85 && bmi < 95) {
        result = "Overweight";
        advice = "Focus on adopting healthier eating habits and increasing physical activity.";
      } else {
        result = "Obese";
        advice = "Seek guidance from a healthcare professional for weight management strategies.";
      }
    } else {
      
      if (bmi < 18.5) {
        result = "Underweight";
        advice = "Consume nutrient-dense foods and consider consulting a dietitian.";
      } else if (bmi >= 18.5 && bmi < 25) {
        result = "Normal";
        advice = "Maintain a balanced diet and engage in regular exercise for overall health.";
      } else if (bmi >= 25 && bmi < 30) {
        result = "Overweight";
        advice = "Make lifestyle changes to reduce calorie intake and increase physical activity.";
      } else {
        result = "Obese";
        advice = "Consult with a healthcare provider for personalized weight management advice.";
      }
    }
  } else if (gender.toLowerCase() == 'female') {
   
    if (age < 2) {
      result = "BMI interpretation not available for infants";
      advice = "Please consult with a pediatrician for further evaluation.";
    } else if (age >= 2 && age <= 19) {
      if (bmi < 5) {
        result = "Underweight";
        advice = "Ensure a balanced diet and regular meals to gain weight.";
      } else if (bmi >= 5 && bmi < 85) {
        result = "Normal";
        advice = "Continue with a healthy lifestyle and regular physical activity.";
      } else if (bmi >= 85 && bmi < 95) {
        result = "Overweight";
        advice = "Focus on adopting healthier eating habits and increasing physical activity.";
      } else {
        result = "Obese";
        advice = "Seek guidance from a healthcare professional for weight management strategies.";
      }
    } else {
      // Age >= 20
      if (bmi < 18.5) {
        result = "Underweight";
        advice = "Consume nutrient-dense foods and consider consulting a dietitian.";
      } else if (bmi >= 18.5 && bmi < 25) {
        result = "Normal";
        advice = "Maintain a balanced diet and engage in regular exercise for overall health.";
      } else if (bmi >= 25 && bmi < 30) {
        result = "Overweight";
        advice = "Make lifestyle changes to reduce calorie intake and increase physical activity.";
      } else {
        result = "Obese";
        advice = "Consult with a healthcare provider for personalized weight management advice.";
      }
    }
  } else {
    result = "Invalid gender specified";
    advice = "Kuch nahi keh sakty boss";
  }

  
  return BMIInterpretation(result, advice);
}

class MyButton extends StatefulWidget {
  String buttonText;
  String gender;
  double height;
  double weight;
  double age;

  MyButton({
    Key? key,
    required this.buttonText,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  }) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  double calculateBmi(double height, double weight) {
    double heightInMeter = height / 100;
    double calcu = weight / (heightInMeter * heightInMeter);
    print(calcu);
    return calcu;
  }

  void onCalculateButtonHandler(double bmiValue, String result, String advice) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (builder) => Result(bmiValue: bmiValue, result: result, advice: advice)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 30.0, bottom: 0.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            double bmi = calculateBmi(widget.height, widget.weight);
    
            BMIInterpretation interpretation = interpretBMI(bmi, widget.age, widget.gender);
            onCalculateButtonHandler(bmi, interpretation.result, interpretation.advice);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF0000),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
          ),
          child: Text(
            widget.buttonText,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
