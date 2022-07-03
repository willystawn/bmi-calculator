import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/view/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  // double calculateBmi() {
  //   double hegihtInMeter = height / 100;

  //   final h = pow(hegihtInMeter, 2);
  //   final bmi = weight / h;

  //   return bmi;
  // }

  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(
        Text(
          "$i",
          style: labelTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final bmiCalculator = BmiCalculator(
            height: height,
            weight: weight,
          );
          bmiCalculator.calculateBmi();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return BmiResultScreen(
                  bmi: bmiCalculator.bmi!,
                );
              }),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xff5170f6),
          ),
          height: 60,
          child: const Center(
            child: Text(
              "Hitung BMI",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      // backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text("BMI Kalkulator")),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor: (gender == "male")
                          ? const Color(0xff5170f6)
                          : Colors.white,
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: GenderIconText(
                                icon: Icons.male,
                                title: "Pria",
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "male")
                                  ? const Color(0xff5170f6)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor: (gender == "female")
                          ? const Color(0xff5170f6)
                          : Colors.white,
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: GenderIconText(
                                icon: Icons.female,
                                title: "Wanita",
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "female")
                                  ? const Color(0xff5170f6)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text(
                  "Tinggi Badan",
                  style: labelTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: BmiCard(
                        child: Slider(
                          thumbColor: const Color(0xffEC3C66),
                          activeColor: Colors.white,
                          value: height.toDouble(),
                          min: 80,
                          max: 200,
                          onChanged: (value) {
                            height = value.toInt();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    BmiCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "$height",
                              style: labelTextStyle,
                            ),
                            Text(
                              " cm",
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Berat",
                          style: labelTextStyle,
                        ),
                        BmiCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                      initialItem: 30),
                                  itemExtent: 25,
                                  magnification: 2,
                                  useMagnifier: true,
                                  onSelectedItemChanged: (val) {
                                    weight = val + 20;
                                  },
                                  children: generateList(20, 220),
                                ),
                              ),
                              // Text(
                              //   "$weight",
                              //   style: numberStyle,
                              // ),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     RawMaterialButton(
                              //       onPressed: () {
                              //         weight--;
                              //         setState(() {});
                              //       },
                              //       elevation: 0,
                              //       child: const Icon(
                              //         Icons.remove,
                              //         color: Colors.white,
                              //       ),
                              //       shape: const CircleBorder(),
                              //       fillColor: const Color(0xff212747),
                              //       constraints: const BoxConstraints.tightFor(
                              //         width: 56,
                              //         height: 56,
                              //       ),
                              //     ),
                              //     RawMaterialButton(
                              //       onPressed: () {
                              //         weight++;
                              //         setState(() {});
                              //       },
                              //       elevation: 0,
                              //       child: const Icon(
                              //         Icons.add,
                              //         color: Colors.white,
                              //       ),
                              //       shape: const CircleBorder(),
                              //       fillColor: const Color(0xff212747),
                              //       constraints: const BoxConstraints.tightFor(
                              //         width: 56,
                              //         height: 56,
                              //       ),
                              //     ),
                              //     const SizedBox(
                              //       width: 10,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Umur",
                          style: labelTextStyle,
                        ),
                        BmiCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                      initialItem: 5),
                                  itemExtent: 25,
                                  magnification: 2,
                                  useMagnifier: true,
                                  onSelectedItemChanged: (val) {
                                    weight = val + 20;
                                  },
                                  children: generateList(15, 90),
                                ),
                              ),
                              // Text(
                              //   "$age",
                              //   style: numberStyle,
                              // ),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     RawMaterialButton(
                              //       onPressed: () {
                              //         age--;
                              //         setState(() {});
                              //       },
                              //       elevation: 0,
                              //       child: const Icon(
                              //         Icons.remove,
                              //         color: Colors.white,
                              //       ),
                              //       shape: const CircleBorder(),
                              //       fillColor: const Color(0xff212747),
                              //       constraints: const BoxConstraints.tightFor(
                              //         width: 56,
                              //         height: 56,
                              //       ),
                              //     ),
                              //     RawMaterialButton(
                              //       onPressed: () {
                              //         age++;
                              //         setState(() {});
                              //       },
                              //       elevation: 0,
                              //       child: const Icon(
                              //         Icons.add,
                              //         color: Colors.white,
                              //       ),
                              //       shape: const CircleBorder(),
                              //       fillColor: const Color(0xff212747),
                              //       constraints: const BoxConstraints.tightFor(
                              //         width: 56,
                              //         height: 56,
                              //       ),
                              //     ),
                              //     const SizedBox(
                              //       width: 10,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor!,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2, 2),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
          )
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: primaryColor,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
