import 'package:flutter/material.dart';

typedef Validation = String? Function(String?);

class CustomFromField extends StatefulWidget {
  String lable;
  TextInputType type;
  TextInputAction action;
  bool isPassword;
  Validation validator;
  TextEditingController controller;


  CustomFromField({super.key,
    required this.lable,
    this.isPassword = false,
    this.type = TextInputType.text,
    this.action = TextInputAction.next,
    required this.validator,
    required this.controller,
  });

  @override
  State<CustomFromField> createState() => _CustomFromFieldState();
}

class _CustomFromFieldState extends State<CustomFromField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      textInputAction: widget.action,
      obscureText: widget.isPassword ? isObscure : false,
      obscuringCharacter: "*",
      keyboardType: widget.type,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          icon: Icon(isObscure ? Icons.visibility_outlined : Icons
              .visibility_off_outlined),
        ) : null,
        labelText: widget.lable,
      ),
    );
  }
}
