import 'package:flutter/material.dart';
import 'package:furevr/component/custom_image_widget.dart';
import 'package:furevr/component/favorite_box.dart';
import 'package:furevr/theme/color_palette.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class PetItem extends StatelessWidget {
  const PetItem(
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
            Positioned(
              bottom: 0,
              child: _buildInfoGlass(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoGlass() {
    return GlassContainer(
      borderRadius: BorderRadius.circular(25),
      blur: 10,
      opacity: 0.15,
      child: Container(
        width: width,
        height: 110,
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: ColorPalette.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfo(),
            const SizedBox(
              height: 5,
            ),
            _buildLocation(),
            const SizedBox(
              height: 15,
            ),
            _buildAttributes(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocation() {
    return Text(
      data["location"],
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: ColorPalette.glassLabelColor,
        fontSize: 13,
      ),
    );
  }

  Widget _buildInfo() {
    return Row(
      children: [
        Expanded(
          child: Text(
            data["name"],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: ColorPalette.glassTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        FavoriteBox(
          isFavorited: data["is_favorited"],
          onTap: onFavoriteTap,
        )
      ],
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

  Widget _buildAttributes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _getAttribute(
          Icons.transgender,
          data["sex"],
        ),
        _getAttribute(
          Icons.color_lens_outlined,
          data["color"],
        ),
        _getAttribute(
          Icons.query_builder,
          data["age"],
        ),
      ],
    );
  }

  Widget _getAttribute(IconData icon, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: ColorPalette.glassLabelColor,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: ColorPalette.glassLabelColor, fontSize: 13),
        ),
      ],
    );
  }
}
