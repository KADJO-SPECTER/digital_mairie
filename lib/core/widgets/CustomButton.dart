import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Widget? child;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    this.label,
    this.child,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50.0,
    this.backgroundColor = const Color(0xFFFB5607), 
    this.textColor = Colors.white, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, 
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: height * 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: Size(width, height),
        elevation: 2,
      ),
      child: child ??
          Text(
            label ?? '',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: textColor, 
            ),
          ),
    );
  }
}
