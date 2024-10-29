import 'package:flutter/material.dart';
import 'package:furevr/component/custom_image_widget.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner(
      {super.key,
      required this.data,
      this.width = 350,
      this.height = 400,
      this.radius = 25,
      this.onTap,
      this.onFavoriteTap});
  final dynamic data;
  final double width;
  final double height;
  final double radius;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Stack(
          children: [
            _buildImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return CustomImage(
      data["image"],
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(radius),
        bottom: Radius.circular(radius),
      ),
      isShadow: false,
      width: width,
      height: 350,
    );
  }
}
