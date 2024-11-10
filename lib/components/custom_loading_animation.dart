import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingAnimation extends StatelessWidget {
  final Color loadingColor;
  final double loadingSize;

  const CustomLoadingAnimation(
      {super.key, required this.loadingColor, required this.loadingSize});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.hexagonDots(
      color: loadingColor,
      size: loadingSize,
    );
  }
}
