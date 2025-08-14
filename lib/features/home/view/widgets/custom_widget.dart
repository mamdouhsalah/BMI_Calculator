import 'package:flutter/material.dart';

Widget customString({
  required BuildContext context,
  required showIcon,
  required bool padding_right,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 89, left: 30, right: 50),
    child: Row(
      spacing: 10,
      children: [
        if (showIcon)
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF65B741),
                size: 28,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        if (padding_right) Padding(padding: EdgeInsets.only(right: 70)),
        Text(
          'BMI',
          style: TextStyle(
            color: Color(0xffFFB534),
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Calculator',
          style: TextStyle(
            color: Color(0xff65B741),
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

Widget customontainerGender({
  required String text_gender,
  required Color colorText,
  required Color colorContainer,
  required String image_gender,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorContainer,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? const Color(0xFF65B741) : Colors.transparent,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text_gender,
              style: TextStyle(
                color: isSelected ? const Color(0xFF65B741) : colorText,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.asset(image_gender, height: 170, width: 140),
          ],
        ),
      ),
    ),
  );
}

class customcardSetValue extends StatefulWidget {
  const customcardSetValue({
    super.key,
    required this.text_Value,
    required this.value,
    required this.onValueChanged,
  });

  final String text_Value;
  final int value;
  final ValueChanged<int> onValueChanged; // هنا الكول باك

  @override
  State<customcardSetValue> createState() => _customcardSetValueState();
}

class _customcardSetValueState extends State<customcardSetValue> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  void _updateValue(int newValue) {
    setState(() {
      value = newValue;
    });
    widget.onValueChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
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
              Text(
                widget.text_Value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFACACAC),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 48,
                  color: Color(0xFFCE922A),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIconButton(Icons.remove, () {
                      if (value > 0) _updateValue(value - 1);
                    }),
                    const SizedBox(width: 25),
                    _buildIconButton(Icons.add, () {
                      _updateValue(value + 1);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 3,
      margin: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 25, color: const Color(0xFF9D6F1F)),
        ),
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final VoidCallback onpressed;
  final String text_buttomn;
  const CustomButtom({
    super.key,
    required this.onpressed,
    required this.text_buttomn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF65B741),
          borderRadius: BorderRadius.circular(25),
        ),
        child: ElevatedButton(
          onPressed: onpressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF65B741),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            text_buttomn,
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
