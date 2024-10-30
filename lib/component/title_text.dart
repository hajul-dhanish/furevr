import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

titleText(String text, {bool showViewAll = false, VoidCallback? callback}) =>
    Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: !showViewAll
          ? Text(
              text,
              style: GoogleFonts.notoSerif(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: GoogleFonts.notoSerif(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (showViewAll)
                  IconButton(
                      onPressed: callback,
                      icon: const Icon(Icons.arrow_right_alt_outlined))
              ],
            ),
    );
