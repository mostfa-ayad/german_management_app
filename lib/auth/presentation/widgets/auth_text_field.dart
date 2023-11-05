import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  TextEditingController controller;
  TextInputType? keyboardType;
  bool isPassword;
  String text;
  bool isVisible;

  AuthTextField(
      {super.key,
      required this.controller,
      required this.keyboardType,
      required this.text,
      this.isPassword = false,
      this.isVisible = true});

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    if (!widget.isPassword) {
      secure = false;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Visibility(
        visible: widget.isVisible,
        child: TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: secure,
          decoration: InputDecoration(
              suffixIcon: (widget.isPassword)
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          secure = !secure;
                        });
                      },
                      icon: Icon((secure)
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined))
                  : null,
              labelText: widget.text,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        ),
      ),
    );
  }
}
