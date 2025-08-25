import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../screens/dashboard_screen.dart';
import '../screens/land_management_screen.dart';
import '../screens/livestock_screen.dart';
import '../screens/reports_screen.dart';
import '../screens/settings_screen.dart';
import '../widgets/navigation/common_bottom_nav_bar.dart';

class MainContainer extends StatefulWidget {
  final int initialPageIndex;

  const MainContainer({Key? key, this.initialPageIndex = 0}) : super(key: key);

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  late int _selectedIndex;
  late PageController _pageController;

  final List<Widget> _pages = [
    const DashboardScreen(),
    const LandManagementScreen(),
    const LivestockScreen(),
    const ReportsScreen(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialPageIndex;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // PopScope ile geri tuşu davranışını kontrol ediyoruz (Flutter 3.x için)
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }

        // Ana sayfada değilsek, ana sayfaya dön
        if (_selectedIndex != 0) {
          _onItemTapped(0);
          return; // Uygulamayı kapatma
        }

        // Ana sayfadaysak, çıkış için onay sor
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Uygulamadan çıkmak istiyor musunuz?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Hayır'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Evet'),
                ),
              ],
            );
          },
        );

        if (shouldPop == true) {
          // Uygulamadan çıkış için gerekli işlemler
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          bottom:
              false, // Don't apply safe area to bottom since we have a custom bottom bar
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(), // Disable swiping
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
        bottomNavigationBar: CommonBottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
