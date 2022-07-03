// import 'package:bmi/constants/constant.dart';
import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
// import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/view/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    Key? key,
    required this.bmi,
    // this.bmiCalculator,
  }) : super(key: key);

  final double bmi;
  // final BmiCalculator? bmiCalculator;

  // String determineBmiCategory(double bmiValue) {
  //   String category = "";

  //   if (bmiValue < 16.0) {
  //     category = underweightSevere;
  //   } else if (bmiValue < 17) {
  //     category = underweightModerate;
  //   } else if (bmiValue < 18.5) {
  //     category = underweightMild;
  //   } else if (bmiValue < 25) {
  //     category = normal;
  //   } else if (bmiValue < 30) {
  //     category = overweight;
  //   } else if (bmiValue < 35) {
  //     category = obeseI;
  //   } else if (bmiValue < 40) {
  //     category = obeseII;
  //   } else {
  //     category = obeseIII;
  //   }

  //   return category;
  // }

  // String getHealthRiskDescription(String categoryName) {
  //   String desc = "";
  //   switch (categoryName) {
  //     case underweightSevere:
  //     case underweightModerate:
  //     case underweightMild:
  //       desc = "Possible nutritional deficiency and osteoporosis.";
  //       break;
  //     case normal:
  //       desc = "Low risk (healthy range).";
  //       break;
  //     case overweight:
  //       desc =
  //           "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
  //       break;
  //     case obeseI:
  //     case obeseII:
  //     case obeseIII:
  //       desc =
  //           "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
  //       break;
  //     default:
  //   }

  //   return desc;
  // }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    // final bmiCategory =
    bmiCalculator.determineBmiCategory();
    // final bmiDesc =
    bmiCalculator.getHealthRiskDescription();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Hitung BMI'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Hasil Perhitungan",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiCalculator.bmiCategory ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      bmiCalculator.bmiDescription!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: const Color(0xff5170f6),
              height: 70,
              child: const Center(
                child: Text(
                  "Hitung Ulang BMI",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
