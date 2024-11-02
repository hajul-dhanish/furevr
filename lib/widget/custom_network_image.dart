import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furevr/utils/utils.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imgUrl;
  const CustomNetworkImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return imgUrl == null
        ? Image.network(
            Utils.noImageDisp(),
          )
        : CachedNetworkImage(
            imageUrl: imgUrl ?? Utils.noImageDisp(),
            errorWidget: (context, str, _) {
              return Image.network(
                Utils.noImageDisp(),
              );
            });
  }
}
