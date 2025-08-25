import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class SlopeRadiusWidget extends StatelessWidget {
  final Decoration? borderDecoration;
  final double borderWidth;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final double radius, topSlope, bottomSlope;

  const SlopeRadiusWidget({
    super.key,
    this.child,
    this.borderDecoration,
    this.borderWidth = 0,
    this.padding = EdgeInsets.zero,
    this.radius = 10,
    this.topSlope = 1,
    this.bottomSlope = 1,
  });

  @override
  Widget build(BuildContext context) {
    final clipper = SlopedClipperWithRadius(
        radius: radius, topSlope: topSlope, bottomSlope: bottomSlope);
    return Padding(
      padding: padding,
      child: ClipPath(
        clipper: clipper,
        child: Container(
          padding: EdgeInsets.all(borderWidth),
          decoration: borderDecoration,
          child: ClipPath(
            clipper: clipper,
            child: child,
          ),
        ),
      ),
    );
  }
}

class SlopedClipperWithRadius extends CustomClipper<Path> {
  final double radius, topSlope, bottomSlope;

  SlopedClipperWithRadius({
    this.radius = 10,
    this.topSlope = 1,
    this.bottomSlope = 1,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    final topOffset = math.tan(topSlope * math.pi / 180) * size.width;
    final bottomOffset = math.tan(bottomSlope * math.pi / 180) * size.width;

    // بالا-چپ
    path.moveTo(0, topOffset + radius);
    path.quadraticBezierTo(0, topOffset, radius, topOffset);

    // بالا-راست
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // پایین-راست
    path.lineTo(size.width, size.height - bottomOffset - radius);
    path.quadraticBezierTo(size.width, size.height - bottomOffset,
        size.width - radius, size.height - bottomOffset);

    // پایین-چپ
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
