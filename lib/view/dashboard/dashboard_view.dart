import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:furevr/component/category_items.dart';
import 'package:furevr/component/pet_item.dart';
import 'package:furevr/component/title_text.dart';
import 'package:furevr/data/remote/demo_db.dart';
import 'package:furevr/routes/nav.dart';
import 'package:furevr/theme/app_theme.dart';
import 'package:furevr/view/auth/login_view.dart';
import 'package:furevr/view/dashboard/dashboard_view_components.dart';
import 'package:furevr/widget/droplet_corossal_widget.dart';
import 'package:furevr/widget/grooming_card_widget.dart';
import 'package:go_router/go_router.dart';

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
              DashboardWidgetComponents.dashboardTopTileWidget(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Ayo, Pookie! 🎀 Ready to crush it? Your Brownie Points are waiting!",
                  style: CustomTextStyles.headingNormal,
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
                callback: () => context.push(Navigation.groomingView),
              ),
              const SizedBox(height: 15),
              _groomingCards(),
              const SizedBox(height: 15),
              titleText(
                "Find the Perfect Outdoor for Your Tifl",
                showViewAll: true,
              ),
              const SizedBox(height: 15),
              const DropletCorossolCardWidget(),
              const SizedBox(height: 15),
              titleText(
                "Adopt New Tifls",
                showViewAll: true,
              ),
              const SizedBox(height: 15),
              _atoptionCard(),
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TextFormField(
            onChanged: (value) {},
            decoration: const InputDecoration(
              isDense: true,
              hintText: "Split it here nigga",
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
                fit: BoxFit.fitWidth,
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

  _atoptionCard() {
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
          width: MediaQuery.of(context).size.width * .8,
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
              child: GroomingCardWidget(
                imgScr: "assets/images/card_dog_1.png",
                fromDistance: "3.6",
                title: "Heads Up For Tails",
                location: "Valencia, Spain",
                average: "800",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: GroomingCardWidget(
                imgScr: "assets/images/card_dog_2.png",
                title: "PET-101",
                fromDistance: "7.1",
                location: "Valencia, Spain",
                average: "900",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
