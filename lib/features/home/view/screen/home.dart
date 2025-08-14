import 'package:flutter/material.dart';
import 'package:BMI_Calculator/features/home/view/widgets/custom_widget.dart';
import 'package:BMI_Calculator/features/home/view/screen/screen2.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = '/';
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedGender;

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: customString(
              context: context,
              padding_right: true,
              showIcon: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 35,
              left: 40,
              right: 50,
              bottom: 30,
            ),
            child: Text(
              'Please choose your gender',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xff0A1207),
              ),
            ),
          ),
          customontainerGender(
            text_gender: "Male",
            colorText: Color(0xFFCE922A),
            colorContainer: Color(0xFFF0F8EC),
            image_gender: "assets/Male.png",
            isSelected: selectedGender == "Male",
            onTap: () => selectGender("Male"),
          ),
          customontainerGender(
            text_gender: "Female",
            colorText: Color(0xFFCE922A),
            colorContainer: Color(0xFFFBF6EE),
            image_gender: "assets/Female.png",
            isSelected: selectedGender == "Female",
            onTap: () => selectGender("Female"),
          ),
          CustomButtom(
            onpressed: () {
              if (selectedGender != null) {
                Navigator.pushNamed(
                  context,
                  Home2.routeName,
                  arguments: {
                    'gender': selectedGender,
                  },
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please select a gender')),
                );
              }
            },
            text_buttomn: 'Continue',
          ),
        ],
      ),
    );
  }
}
