import 'package:blur/blur.dart';
import 'package:demo/theme/colors.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final String image;
  const IconWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 8,
      borderRadius: BorderRadius.circular(50),
      blurColor: Colors.grey,
      overlay: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        padding: const EdgeInsets.all(15),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(image, color: AppColor.white, width: 25),
      ),
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        padding: const EdgeInsets.all(15),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(image, color: AppColor.white, width: 25),
      ),
    );
  }
}
