import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataSets {
  Widget getImages(imageName) =>
      SvgPicture.asset('assets/images/$imageName.svg');
}
