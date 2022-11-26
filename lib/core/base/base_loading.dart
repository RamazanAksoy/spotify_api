import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseLoadingShimmer extends StatelessWidget {
  const BaseLoadingShimmer(
      {super.key,
      required this.loadingWidget,
      required this.currentWidget,
      required this.isLoading});
  final Widget loadingWidget;
  final Widget currentWidget;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: loadingWidget)
        : currentWidget;
  }
}
