import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
// ignore: depend_on_referenced_packages
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../shared/presentation/color/app_colors.dart';

class MyTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType textInputType;
  final TextEditingController controller;
  final int maxLines;
  final bool? isLocation;
  final bool? isDescription;
  final bool? isTime;
  final BoxConstraints? suffixIconConstraints;
  const MyTextField({super.key, 
    required this.textInputType,
    required this.controller,
    this.inputFormatters,
    this.isLocation,
    this.isDescription,
    this.isTime,
    required this.maxLines,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        suffixIconConstraints: suffixIconConstraints,
        fillColor: AppColors.greyWithOpacity,
        filled: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  const NameTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: controller,
      maxLines: 1,
      textInputType: TextInputType.text,
    );
  }
}

class DescriptionTextField extends StatelessWidget {
  final TextEditingController controller;
  const DescriptionTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: controller,
      maxLines: 5,
      textInputType: TextInputType.text,
    );
  }
}

class LocationTextField extends StatelessWidget {
  final TextEditingController controller;
  const LocationTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      textInputType: TextInputType.text,
      controller: controller,
      maxLines: 1,
      suffixIcon: SvgPicture.asset(
        'assets/svgs/location.svg',
        height: 13,
        width: 14,
      ),
      suffixIconColor: AppColors.blue,
      suffixIconConstraints:
          const BoxConstraints(maxHeight: 13, maxWidth: 14),
    );
  }
}

class TimeTextField extends StatelessWidget {
  final TextEditingController controller;
  const TimeTextField({super.key, required this.controller});
  static MaskTextInputFormatter maskInputFormater = MaskTextInputFormatter(
      mask: '##:## - ##:##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: controller,
      maxLines: 1,
      textInputType: TextInputType.number,
      inputFormatters: [maskInputFormater],
    );
  }
}
