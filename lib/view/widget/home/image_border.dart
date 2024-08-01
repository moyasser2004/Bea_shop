import 'package:flutter/material.dart';
import '../../../core/widget/cached_network_image.dart';

class ImageBorder extends StatelessWidget {
  final double padding;
  final double margin;
  final String image;
  final Color borderColor;
  final Color color;
  final double height;
  final double width;

  const ImageBorder({
    super.key,
    this.padding = 10,
    this.margin = 15,
    required this.image,
    required this.borderColor,
    required this.height,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(padding),
        margin: EdgeInsets.all(margin),
        child: Center(
          child:
              CachedNetworkImageUtils(image: image, height: height),
        ));
  }
}
