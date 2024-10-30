import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardWidgetComponents {
  static Widget dashboardTopTileWidget() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "KPS Towers, Chennai",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/pet-border.svg",
                width: 25,
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Text("Micky"),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ],
      ),
    );
  }

}
