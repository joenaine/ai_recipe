import 'package:flutter/material.dart';
import '/constants/app_colors_const.dart';
import '/constants/app_styles_const.dart';

class Text24 extends StatelessWidget {
  const Text24({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppStyles.s24w600);
  }
}

class TextS14W500 extends StatelessWidget {
  const TextS14W500({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.s14w500,
    );
  }
}

class TextS16W500 extends StatelessWidget {
  const TextS16W500({
    Key? key,
    required this.text,
    this.color = AppColors.dark,
  }) : super(key: key);
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.s16w500.copyWith(color: color),
    );
  }
}
