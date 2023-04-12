import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ForestedGlassWidget extends StatelessWidget {
  final Widget childWidget;
  final double width, height;
  const ForestedGlassWidget(
      {super.key,
      required this.childWidget,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: width,
      height: height,
      borderRadius: 20,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.1),
          const Color(0xFFFFFFFF).withOpacity(0.05),
        ],
        stops: const [
          0.1,
          1,
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: childWidget,
    );
  }
}
