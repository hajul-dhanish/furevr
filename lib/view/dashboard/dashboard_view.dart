import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furevr/component/category_items.dart';
import 'package:furevr/component/notification_box.dart';
import 'package:furevr/component/pet_item.dart';
import 'package:furevr/component/service_card_widget.dart';
import 'package:furevr/component/title_text.dart';
import 'package:furevr/data/remote/demo_db.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
                    // NotificationBox(
                    //   notifiedNumber: 4,
                    //   onTap: null,
                    // )
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
              ),
              const SizedBox(height: 10),
              _buildSearch(),
              const SizedBox(height: 25),
              _buildHomeBanner(),
              const SizedBox(height: 15),
              titleText(
                "Style your Tifl like a pro",
                showViewAll: true,
              ),
              const SizedBox(height: 15),
              _groomingCards(),
              //
              const SizedBox(height: 15),
              titleText(
                "Adopt New Tifls",
                showViewAll: true,
              ),
              const SizedBox(height: 15),
              _buildCards(),
              //
              const SizedBox(height: 65),
            ],
          ),
        ),
      ),
    );
  }

  int _selectedCategory = 0;

  _buildSearch() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                // searchQuery = value;
              });
            },
            decoration: const InputDecoration(
              isDense: true,
              hintText: "Search Your Pets",
              prefixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      );

  _buildHomeBanner() {
    final ads = [
      "assets/ads/ad1.jpg",
      "assets/ads/ad2.jpg",
      "assets/ads/ad3.jpg",
      "assets/ads/ad4.jpg",
      "assets/ads/ad5.jpg",
    ];
    double width = MediaQuery.of(context).size.width * .8;

    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          viewportFraction: 1,
          disableCenter: true,
          enableInfiniteScroll: true,
          autoPlay: true,
        ),
        itemCount: ads.length,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                image: AssetImage(
                  ads[index],
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        },
      ),
    );
  }

  _buildCategories() {
    List<Widget> lists = List.generate(
      categories.length,
      (index) => CategoryItem(
        data: categories[index],
        selected: index == _selectedCategory,
        onTap: () {
          setState(() {
            _selectedCategory = index;
          });
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  _buildCards() {
    double width = MediaQuery.of(context).size.width * .8;

    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .8,
      ),
      items: List.generate(
        pets.length,
        (index) => PetItem(
          data: pets[index],
          width: width,
          onTap: null,
          onFavoriteTap: () {
            setState(() {
              pets[index]["is_favorited"] = !pets[index]["is_favorited"];
            });
          },
        ),
      ),
    );
  }

  _groomingCards() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
              child: WalkGroupCard(
                imgScr: "assets/images/card_dog_1.png",
                fromDistance: "3.6",
                title: "Heads Up For Tails",
                location: "Valencia, Spain",
                average: "800",
                orgBy: "Laura",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: WalkGroupCard(
                imgScr: "assets/images/card_dog_2.png",
                title: "PET-101",
                fromDistance: "7.1",
                location: "Valencia, Spain",
                average: "900",
                orgBy: "Laura",
              ),
            ),
            // WalkGroupCard()
          ],
        ),
      ),
    );
  }
}
