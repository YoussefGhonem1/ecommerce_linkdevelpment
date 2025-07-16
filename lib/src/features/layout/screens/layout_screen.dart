import 'package:ecommerce_app/src/features/layout/screens/home_tab.dart';
import 'package:ecommerce_app/src/features/layout/screens/notification_tab.dart';
import 'package:ecommerce_app/src/features/layout/screens/orders_tab.dart';
import 'package:ecommerce_app/src/features/layout/screens/profile_tab.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';


import '../../../../generated/assets.dart';
import '../widgets/custom_nav_item.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  List<Widget> tabs=[
    HomeTab(),
    NotificationTab(),
    OrdersTab(),
    ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.bgLightColor,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: CustomNavBarItem(selectedIndex: _selectedIndex, navBarItem: 0, iconPath: Assets.iconsHome),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: CustomNavBarItem(selectedIndex: _selectedIndex, navBarItem: 1, iconPath: Assets.iconsNotification),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: CustomNavBarItem(selectedIndex: _selectedIndex, navBarItem: 2, iconPath: Assets.iconsOrders),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: CustomNavBarItem(selectedIndex: _selectedIndex, navBarItem: 3, iconPath: Assets.iconsProfile),
              label: "",
            ),
          ]),
      body: tabs[_selectedIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
