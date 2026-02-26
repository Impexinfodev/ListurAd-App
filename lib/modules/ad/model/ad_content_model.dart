import 'dart:ui';

class AdContentModel {
  final String? image;
  final String? title;
  final String? description;
  final TextPosition textPosition;
  final ImagePosition imagePosition;
  final Color textColor;

  AdContentModel({
    this.image,
    this.title,
    this.description,
    required this.textPosition,
    required this.imagePosition,
    required this.textColor,
  });
}

enum TextPosition { top, left, right }
enum ImagePosition { top, left, right, bottom }
