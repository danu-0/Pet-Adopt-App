import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/theme/colour.dart';
import '/theme/text.dart';

class CustomForm extends StatelessWidget {
  final String desk;
  final IconData icon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const CustomForm(
      {required this.desk,
      required this.icon,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(desk, style: TextApp.reguler),
        SizedBox(height: 18),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: baseColour,
            ),
            hintText: desk,
            hintStyle: TextStyle(
              color: secondarytext,
              fontWeight: regular,
              fontSize: 14,
            ),
            border: styleBorder(),
            enabledBorder: styleBorder(),
            focusedBorder: styleBorder(),
            disabledBorder: styleBorder(),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 15,
            ),
          ),
        ),
      ],
    );
  }

  InputBorder styleBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: baseColour, width: 1.5),
    );
  }
}

class CustomFormP extends StatelessWidget {
  final String desk;
  final IconData icon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const CustomFormP(
      {required this.desk,
      required this.icon,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    var _obsecure = true.obs;
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(desk, style: TextApp.reguler),
          SizedBox(height: 18),
          Obx(
            () => TextFormField(
              controller: controller,
              validator: validator,
              maxLength: 5,
              obscureText: _obsecure.value,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: baseColour,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _obsecure.value = !_obsecure.value;
                  },
                  child: Icon(
                    _obsecure.value ? Icons.visibility : Icons.visibility_off,
                    color: baseColour,
                  ),
                ),
                hintText: 'password',
                hintStyle: TextStyle(
                    color: secondarytext, fontWeight: regular, fontSize: 14),
                border: styleBorder(),
                enabledBorder: styleBorder(),
                focusedBorder: styleBorder(),
                disabledBorder: styleBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder styleBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: baseColour, width: 1.5));
  }
}
