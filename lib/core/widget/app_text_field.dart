import 'package:flutter/material.dart';
import 'package:german_management_app/core/colors.dart';

class AppTextField extends StatelessWidget {
  TextEditingController controller;
  String title;
  TextInputType textInputType;
  void Function(String)? onChanged;
  AppTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.textInputType,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 5, left: 5),
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
            labelText: title,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    const BorderSide(color: AppColors.borderColor, width: 1))),
      ),
    );
  }
}
