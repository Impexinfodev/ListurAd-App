import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageUtility {
  PickImageUtility.instance({
    required this.context,
  });

  final ImagePicker _picker = ImagePicker();
  final BuildContext context;

  Future<File?> pickedFile(ImageSource imageSource) async {
    final pickedImage = await _picker.pickImage(
      source: imageSource,
    );
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }
}