import 'package:flutter/material.dart';
import 'package:BMI_Calculator/features/home/view/screen/result.dart';
import 'package:BMI_Calculator/features/home/view/widgets/custom_widget.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});
  static const String routeName = '/screen2';

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  int weight = 0;
  int age = 0;
  int height = 0;
  late String gender; // هنخزن النوع هنا

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    gender = args['gender']; // استلام النوع من Screen1
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          customString(context: context, showIcon: true, padding_right: false),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Please Modify the values",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 40),
                Row(
                  spacing: 10,
                  children: [
                    customcardSetValue(
                      text_Value: 'Weight',
                      value: weight,
                      onValueChanged: (newValue) {
                        setState(() {
                          weight = newValue;
                        });
                      },
                    ),
                    customcardSetValue(
                      text_Value: 'Age',
                      value: age,
                      onValueChanged: (newValue) {
                        setState(() {
                          age = newValue;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 3,
                  margin: const EdgeInsets.all(5),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBF6EE),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        const Text(
                          "Height (cm)",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFACACAC),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          height.toString(),
                          style: const TextStyle(
                            fontSize: 48,
                            color: Color(0xFFCE922A),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: const Color(0xFFCE922A),
                            inactiveTrackColor: Colors.grey[300],
                            thumbColor: const Color(0xFFCE922A),
                            overlayColor: const Color(0xFFCE922A).withAlpha(50),
                            trackHeight: 4.0,
                          ),
                          child: Slider(
                            min: 0,
                            max: 220,
                            divisions: 220,
                            value: height.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                height = value.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButtom(
                  onpressed: () {
                    Navigator.pushNamed(
                      context,
                      Home3.routeName,
                      arguments: {
                        'weight': weight,
                        'height': height,
                        'age': age,
                        'gender': gender,
                      },
                    );
                  },
                  text_buttomn: "Calculate",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
