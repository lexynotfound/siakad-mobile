import 'package:flutter/material.dart';
import '../constants/colors.dart';

enum ButtonStyle {filled, outlined}

class Button extends StatelessWidget{
  const Button.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.filled,
    this.color = ColorName.primary,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 50.0
    this.borderRadius = 6.0
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.outlined,
    this.textColor = ColorName.black,
    this.width = double.infinity,
    this.height = a50.0,
    this.borderRadius = 6.0,
    this.icon,
  });
}