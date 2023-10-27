import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataSets {
  Widget getImage(imageName, extention) {
    var imagePath = 'assets/images/$imageName.$extention';
    if (extention == 'svg') {
      return SvgPicture.asset(imagePath);
    } else {
      return Image.asset(imagePath);
    }
  }
}
