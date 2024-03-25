import 'package:flutter/material.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLayout extends StatelessWidget {
  const ShimmerLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const Color color = AppColors.lightGrey;

    return Shimmer.fromColors(
      highlightColor: color.withOpacity(0.3),
      baseColor: color.withOpacity(0.5),
      child: child,
    );
  }
}

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(children: [
          Container(
            height: 150,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
            ),
          ),
        ]));
  }
}
