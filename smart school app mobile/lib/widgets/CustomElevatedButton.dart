import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final List<Color> gradientColors;
  final Color textColor;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.borderRadius = 15.0,
    this.padding = const EdgeInsets.symmetric(vertical: 15),
    this.fontSize = 16.0,
    this.gradientColors = const [Colors.blue, Color.fromARGB(255, 0, 17, 125)], 
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0, // Enlever l'ombre pour voir le dégradé clairement
          backgroundColor: Colors.transparent, // Transparence pour laisser voir le dégradé
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
