import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/core/extensions/context_extension.dart';

class TextFormFiledWidget extends StatelessWidget {
  final String label;

  final TextInputType textInputType;
  final TextEditingController controller;

  final Function(String)? onChange;
  final String? Function(String?)? validator;

  const TextFormFiledWidget({
    Key? key,
    required this.label,
    required this.textInputType,
    required this.controller,
    this.onChange,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 10.w,
        right: 3.w,
      ),
      child: TextFormField(
        onChanged: onChange,
        controller: controller,
        validator: validator,
        cursorColor: context.checkIsLightTheme() ? Colors.black : Colors.white,
        decoration: InputDecoration(
          filled: true,
          labelText: label,
          fillColor: const Color(0xFFF3F3F3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          labelStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 15.sp,
                color: const Color(0xFFB0B3BA),
              ),
        ),
      ),
    );
  }
}
