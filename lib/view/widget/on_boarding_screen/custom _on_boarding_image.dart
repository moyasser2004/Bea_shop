import 'package:flutter/material.dart';

class CustomOnBoardingImage extends StatelessWidget {
  const CustomOnBoardingImage(
      {super.key, required this.image, required this.width});
  final String image;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: width,
        child: AspectRatio(
          aspectRatio: 1.1,
          child: Image.asset(
            image,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
