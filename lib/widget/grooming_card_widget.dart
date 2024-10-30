import 'package:flutter/material.dart';
import 'package:furevr/theme/app_theme.dart';
import 'package:furevr/theme/color_palette.dart';
import 'package:furevr/utils/constant.dart';

class GroomingCardWidget extends StatelessWidget {
  final String imgScr;
  final String title;
  final String location;
  final String fromDistance;
  final String average;
  const GroomingCardWidget({
    super.key,
    required this.imgScr,
    required this.title,
    required this.location,
    required this.average,
    required this.fromDistance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: ColorPalette.primary.withOpacity(0.5), width: 0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          width: 280,
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Image.asset(imgScr),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorPalette.playfulGreen,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Text("4.2"),
                                Icon(Icons.star, size: 16),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.location_pin,
                          size: 17,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          location,
                          style: contentBlack,
                        ),
                        Text(
                          " ($fromDistance km)",
                          style: CustomTextStyles.captionNormal,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.attach_money_sharp,
                          size: 17,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "$average avg.",
                          style: contentBlack,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
