import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomeButton extends StatelessWidget {
  final VoidCallback function;
  final Color backgroundColor;
  final String txt;
  final double? buttonWidth;
  final String imagePath;
  final double? imageWidth;
  final double? imageHeight;

  const CustomeButton({
    super.key,
    required this.function,
    required this.backgroundColor,
    required this.imagePath,
    required this.txt,
    this.imageWidth,
    this.buttonWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: MaterialButton(
        onPressed: function,
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minWidth: buttonWidth,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image(
                height: imageHeight?.h,
                width: imageWidth?.w,
                fit: BoxFit.cover,
                image: AssetImage(imagePath),
              ),
              SizedBox(
                width: 1.w,
              ),
              Text(
                txt,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
