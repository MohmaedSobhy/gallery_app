import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeTextFormField extends StatelessWidget {
  final String? hint;
  final TextInputType inputType;
  final TextEditingController? controller;
  final bool? obscure;
  var onSubmit;
  // ignore: prefer_typing_uninitialized_variables
  var validator;
  CustomeTextFormField({
    super.key,
    this.validator,
    this.controller,
    required this.inputType,
    this.hint,
    this.onSubmit,
    this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: validator,
      onFieldSubmitted: onSubmit,
      maxLines: 1,
      obscureText: (obscure == null) ? false : obscure!,
      decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.white),
          )),
    );
  }
}
