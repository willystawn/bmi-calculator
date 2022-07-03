import 'dart:math';
import 'package:bmi/constants/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    // this.bmi = bmi;
  }

  double calculateBmi() {
    double hegihtInMeter = height! / 100;

    final h = pow(hegihtInMeter, 2);
    bmi = weight! / h;

    return bmi!;
  }

  String determineBmiCategory() {
    String category = "";

    if (bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmi! < 17) {
      category = underweightModerate;
    } else if (bmi! < 18.5) {
      category = underweightMild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overweight;
    } else if (bmi! < 35) {
      category = obeseI;
    } else if (bmi! < 40) {
      category = obeseII;
    } else {
      category = obeseIII;
    }

    bmiCategory = category;

    return bmiCategory!;
  }

  String getHealthRiskDescription() {
    String desc = "";
    switch (bmiCategory!) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Kemungkinan kekurangan nutrisi dan osteoporosis.";
        break;
      case normal:
        desc = "Risiko rendah (Rata-rata sehat).";
        break;
      case overweight:
        desc =
            "Risiko sedang terkena penyakit jantung, tekanan darah tinggi, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "Risiko tinggi terkena penyakit jantung, tekanan darah tinggi, stroke, diabetes mellitus.";
        break;
      default:
    }

    bmiDescription = desc;
    return bmiDescription!;
  }
}
