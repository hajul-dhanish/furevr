import 'package:flutter/material.dart';
import 'package:furevr/theme/app_theme.dart';

class BoardingCardWidget extends StatelessWidget {
  final String imgScr;
  final String title;
  final String location;
  final String fromDistance;
  final String average;
  final String description;
  const BoardingCardWidget({
    super.key,
    required this.imgScr,
    required this.title,
    required this.location,
    required this.average,
    required this.description,
    required this.fromDistance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    imgScr,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 5),
                    Text(
                      title,
                      style: CustomTextStyles.headingBold,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      location,
                      style: CustomTextStyles.headingNormal,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      maxLines: 2,
                      style: CustomTextStyles.bodyDefault,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
