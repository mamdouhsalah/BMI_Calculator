import 'package:BMI_Calculator/features/home/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:BMI_Calculator/features/home/view/widgets/custom_widget.dart';

class Home3 extends StatefulWidget {
  const Home3({super.key});
  static const String routeName = '/result';

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  late double weight;
  late double height;
  late int age;
  late String gender;
  late double bmi;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      weight = (args['weight'] ?? 0).toDouble();
      height = (args['height'] ?? 0).toDouble();
      age = (args['age'] ?? 0).toInt();
      gender = args['gender']?.toString() ?? "";

      bmi = height > 0 ? weight / ((height / 100) * (height / 100)) : 0;
    } else {
      // fallback values in case arguments are null
      weight = 0;
      height = 0;
      age = 0;
      gender = "";
      bmi = 0;
    }
  }

  String getBmiStatus() {
    if (bmi == 0) return "No data";
    if (bmi < 16)
      return "Severely Underweight 🚨 — Seek medical advice immediately.";
    if (bmi < 18.5) return "Underweight 🥗 — Below healthy range.";
    if (bmi < 24.9) return "Normal ✅ — Within healthy range.";
    if (bmi < 29.9) return "Overweight ⚠️ — Slightly above healthy range.";
    return "Obese 🚨 — Above healthy range, consider medical advice.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customString(context: context, showIcon: true, padding_right: false),
          const SizedBox(height: 40),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.green.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Your BMI:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),

                    child: Text(
                      getBmiStatus(),
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: Color(0xffACACAC)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${weight.toStringAsFixed(1)} kg",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Color(0xff519234),
                            ),
                          ),
                          const Text(
                            "Weight",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xffACACAC),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${height.toStringAsFixed(1)} cm",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Color(0xff519234),
                            ),
                          ),
                          const Text(
                            "Height",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xffACACAC),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "$age",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Color(0xff519234),
                            ),
                          ),
                          const Text(
                            "Age",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xffACACAC),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            gender,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Color(0xff519234),
                            ),
                          ),
                          const Text(
                            "Gender",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xffACACAC),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Healthy weight for the height:",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                  Text(
                    "${(18.5 * (height / 100) * (height / 100)).toStringAsFixed(1)} kg - ${(24.9 * (height / 100) * (height / 100)).toStringAsFixed(1)} kg",
                    style: const TextStyle(
                      color: Color(0xff519234),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomButtom(
                    onpressed: () {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(Home.routeName),
                      );
                    },
                    text_buttomn: "Close",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
