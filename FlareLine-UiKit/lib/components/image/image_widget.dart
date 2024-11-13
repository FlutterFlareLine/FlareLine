import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool? isCircle;
  final BorderRadius? borderRadius;
  final String? package;

  const ImageWidget(
      {super.key, this.imageUrl, this.width, this.height, this.fit, this.isCircle, this.borderRadius = BorderRadius
          .zero, this.package});

  @override
  Widget build(BuildContext context) {
    Widget? widget = null;
    if (imageUrl == null || imageUrl!.isEmpty) {
      widget = SizedBox(width: width, height: height, child: Placeholder());
    } else if (imageUrl!.startsWith("http://") || imageUrl!.startsWith("https://")) {
      widget = Image.network(
        imageUrl!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
      );
    } else if (imageUrl!.endsWith(".svg")) {
      widget = SvgPicture.asset(
        imageUrl!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        package: package,
      );
    } else {
      widget = Image.asset(
        imageUrl!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        package: package,
      );
    }
    if (isCircle ?? false) {
      return CircleAvatar(
        child: widget,
        radius: (width ?? 0 / 2),
        backgroundColor: Colors.transparent,
      );
    }

    if (borderRadius == BorderRadius
        .zero) {
      return widget;
    }

    return ClipRRect(
      borderRadius: borderRadius!,
      child: widget,
    );
  }
}
