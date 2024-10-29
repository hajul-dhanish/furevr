import 'package:flutter/material.dart';
import 'package:furevr/component/title_text.dart';
import 'package:furevr/view/services/search_ko.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.center,
                child: titleText(
                  "Find anything you need for your pets",
                )),
            const SizedBox(
              height: 30,
            ),
            const SearchCardDog(
              itemOneTitle: "Vet \nClinics",
              itemOneImg: "assets/images/card_1.png",
              itemOneBgColor: card1,
              itemOneTextColor: textWhite,
              itemTwoTitle: "Places \nto eat",
              itemTwoImg: "assets/images/card_2.png",
              itemTwoBgColor: card2,
              itemTwoTextColor: textBlack,
            ),
            const SearchCardDog(
              itemOneTitle: "Places \nto walk",
              itemOneImg: "assets/images/card_3.png",
              itemOneBgColor: card3,
              itemOneTextColor: textWhite,
              itemTwoTitle: "Spas \n& Salons",
              itemTwoImg: "assets/images/card_4.png",
              itemTwoBgColor: card4,
              itemTwoTextColor: textBlack,
            ),
            const SearchCardDog(
              itemOneTitle: "Shops \n& Products",
              itemOneImg: "assets/images/card_5.png",
              itemOneBgColor: card5,
              itemOneTextColor: textBlack,
              itemTwoTitle: "Walk \ngroups ",
              itemTwoImg: "assets/images/card_6.png",
              itemTwoBgColor: card6,
              itemTwoTextColor: textWhite,
            ),
            const SearchCardDog(
              itemOneTitle: "Animals \nin adoption",
              itemOneImg: "assets/images/card_7.png",
              itemOneBgColor: card7,
              itemOneTextColor: textBlack,
              itemTwoTitle: "Walk \ngroups ",
              itemTwoImg: "assets/images/card_8.png",
              itemTwoBgColor: card8,
              itemTwoTextColor: textWhite,
            ),
            const SizedBox(height: 65),
          ],
        ),
      ),
    ));
  }
}

const card1 = Color(0xFF15464E);
const card2 = Color(0xFFC9E193);
const card3 = Color(0xFF00B7B7);
const card4 = Color(0xFFB6DDDF);
const card5 = Color(0xFFC9E193);
const card6 = Color(0xFF15464E);
const card7 = Color(0xFFB6DDDF);
const card8 = Color(0xFF00B7B7);

const appBackground = Color(0xFFEFF5F4);
const primary = Color(0xFF00B7B7);
const white = Color(0xFFFFFFFF);
const textWhite = Color(0xFFFFFFFF);
const textBlack = Color(0xFF000000);
