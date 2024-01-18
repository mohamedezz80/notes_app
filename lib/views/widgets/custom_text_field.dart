import 'package:flutter/material.dart';
import 'package:notes_app/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.maxLine = 1,
    this.onSaved,
    this.onChanged,
    //this.validate,
  }) : super(key: key);
  final String hintText;
  final int maxLine;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  //final String? Function(String?)? validate;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.kTextBlue,
      maxLines: maxLine,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Feild is required';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.kButtonColor,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(AppColor.kTextBlue),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? AppColor.kWhite,
      ),
    );
  }
}
