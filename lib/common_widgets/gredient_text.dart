import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const GradientText(
      this.text, {
        super.key,
        this.style,
        this.textAlign,
      });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xE62388FF), // 90% opacity
            Color(0xB32388FF), // 70% opacity
          ],
        ).createShader(bounds);
      },
      child: Text(
        text,
        textAlign: textAlign,
        style: (style ?? const TextStyle()).copyWith(
          color: Colors.white, // IMPORTANT
        ),
      ),
    );
  }
}
