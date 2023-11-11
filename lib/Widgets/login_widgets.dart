import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomInputField({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 200, 200, 200), fontSize: 15),
        ),
        keyboardType: hintText == 'Phone Number' ? TextInputType.number : TextInputType.name,
        cursorColor: Colors.black,
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  const CustomButton({super.key, required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    // String text = text.toLowerCase() == 'continue' ? 'Continue' : 'Sign up instead';
    Color textColor = text.toLowerCase() == 'continue' ? Colors.white : Colors.black;
    Color bgColor = text.toLowerCase() == 'continue' ? Colors.black : const Color.fromARGB(255, 240, 240, 240);
    Color borderColor = text.toLowerCase() == 'continue' ? Colors.black : Colors.grey.withAlpha(10);
    Color splashColor = text.toLowerCase() == 'continue' ? Colors.white : Colors.black;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        splashColor: splashColor,
        onTap: function,
        child: Ink(
          height: 60,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            border: Border.all(width: 1, color: borderColor)
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor, 
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}