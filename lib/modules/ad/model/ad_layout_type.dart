import 'dart:ui';

enum AdLayoutType {
  textOnly,
  yellowText,
  pinkText,
  imageOnly,
  imageWithText,
  imageWithTextLayoutLeft,
  imageWithTextLayoutRight,
  textWithImage,
}

class AdTypeModel {
  final String? title;
  final AdLayoutType layoutType;
  final String price;
  final bool? showTitleInImage;
  final VoidCallback onTap;

  AdTypeModel({
    this.title,
    required this.layoutType,
    required this.price,
    this.showTitleInImage,
    required this.onTap,
  });
}
