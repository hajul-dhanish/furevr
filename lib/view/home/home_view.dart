import 'package:flutter/material.dart';
import 'package:furevr/data/local/SharedPref.dart';
import 'package:furevr/view/dashboard/dashboard_view.dart';
import 'package:furevr/view/collection/service_view.dart';
import 'package:furevr/view/profile/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  int _activeTab = 0;

  final List<Widget> screens = const [
    DashboardView(),
    CollectionView(),
    Text(""),
    ProfileView(),
  ];

  List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home_filled),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard_outlined),
      activeIcon: Icon(Icons.dashboard_rounded),
      label: 'Services',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history_outlined),
      activeIcon: Icon(Icons.history_rounded),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.pets_rounded),
      activeIcon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String username = await UserSharedPreferences().getUserNamePref();
      username;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_activeTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeTab,
        items: bottomNavItems,
        onTap: (index) {
          setState(() {
            _activeTab = index;
          });
        },
      ),
    );
  }
}
