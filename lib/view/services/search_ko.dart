import 'package:flutter/material.dart';

class SearchCardDog extends StatelessWidget {
  final String itemOneImg;
  final String itemOneTitle;
  final Color itemOneBgColor;
  final Color itemOneTextColor;
  final String itemTwoImg;
  final String itemTwoTitle;
  final Color itemTwoBgColor;
  final Color itemTwoTextColor;
  const SearchCardDog({
    super.key,
    required this.itemOneImg,
    required this.itemOneTitle,
    required this.itemOneBgColor,
    required this.itemOneTextColor,
    required this.itemTwoImg,
    required this.itemTwoTitle,
    required this.itemTwoBgColor,
    required this.itemTwoTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: SizedBox(
            width: double.infinity,
            height: 140,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        color: itemOneBgColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          itemOneTitle,
                          style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              color: itemOneTextColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -20,
                  top: -10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(itemOneImg),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 25),
        Flexible(
          child: SizedBox(
            width: double.infinity,
            height: 140,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        color: itemTwoBgColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          itemTwoTitle,
                          style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              color: itemTwoTextColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -20,
                  top: -10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(itemTwoImg),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
