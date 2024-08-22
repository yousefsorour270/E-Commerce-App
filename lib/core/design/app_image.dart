import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double radius;
  final double? height, width;

  const AppImage(
    this.image, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.scaleDown,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Builder(
        builder: (context) {
          if (image.endsWith("svg")) {
            return SvgPicture.asset(
              "assets/svg/$image",
              height: height,
              width: width,
              fit: fit,
            );
          } else if (image.startsWith("https")) {
            return Image.network(
              image,
              height: height,
              width: width,
              errorBuilder: (context, error, stackTrace) => _errorWidget,
              fit: fit,
            );
          } else if (image.contains("com.div.project1")) {
            return Image.file(
              File(image),
              height: height,
              width: width,
              errorBuilder: (context, error, stackTrace) => _errorWidget,
              fit: fit,
            );
          } else {
            return Image.asset(
              "assets/images/$image",
              height: height,
              width: width,
              errorBuilder: (context, error, stackTrace) => _errorWidget,
              fit: fit,
            );
          }
        },
      ),
    );
  }

  Widget get _errorWidget {
    return Text("Error");
  }
}
