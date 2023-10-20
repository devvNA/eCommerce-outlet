import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoading extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxShape shape;

  const SkeletonLoading(
      {super.key, this.width, this.height, this.shape = BoxShape.rectangle});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.grey.withOpacity(0.1),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                shape == BoxShape.circle ? null : BorderRadius.circular(8.0),
            shape: shape,
          ),
        ));
  }
}
