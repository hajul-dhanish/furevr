import 'package:flutter/material.dart';
import 'package:furevr/component/bottom_bar_widget.dart';
import 'package:furevr/theme/color_palette.dart';
import 'package:furevr/view/dashboard/dashboard_view.dart';
import 'package:furevr/view/dashboard/settings_view.dart';
import 'package:furevr/view/services/service_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  int _activeTab = 0;
  final List barItems = [
    {
      "icon": "assets/icons/home-border.svg",
      "active_icon": "assets/icons/home.svg",
      "page": const DashboardView(),
    },
    {
      "icon": "assets/icons/pet-border.svg",
      "active_icon": "assets/icons/pet.svg",
      "page": const SearchPage(),
    },
    {
      "icon": "assets/icons/chat-border.svg",
      "active_icon": "assets/icons/chat.svg",
      "page": const Text("ko"),
    },
    {
      "icon": "assets/icons/setting-border.svg",
      "active_icon": "assets/icons/setting.svg",
      "page": const SettingsView(),
    },
  ];

//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  _buildAnimatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      _activeTab = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.appBgColor,
      body: _buildPage(),
      floatingActionButton: _buildBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildPage() {
    return IndexedStack(
      index: _activeTab,
      children: List.generate(
        barItems.length,
        (index) => _buildAnimatedPage(barItems[index]["page"]),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        color: ColorPalette.bottomBarColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ColorPalette.shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          barItems.length,
          (index) => BottomBarItem(
            _activeTab == index
                ? barItems[index]["active_icon"]
                : barItems[index]["icon"],
            isActive: _activeTab == index,
            activeColor: ColorPalette.primary,
            onTap: () => onPageChanged(index),
          ),
        ),
      ),
    );
  }
}
