import 'dart:developer';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/MyCartScreen.dart';
import 'package:mns/ui/screens/MyFavScreen.dart';
import 'package:mns/ui/screens/MyHomeScreen.dart';
import 'package:mns/ui/screens/MyProfileScreen.dart';
import 'package:mns/ui/screens/MySearchScreen.dart';
import 'package:provider/provider.dart';

class MainAllScreens extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainAllScreens> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      // designSize: Size(360, 690),
      designSize: const Size(411.42857142857144, 797.7142857142857),
      context: context,
      minTextAdapt: true,
      // orientation: Orientation.portrait
    );
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          MyHomeScreen(),
          MySearchScreen(),
          MyCartScreen(),
          
          MyProfileScreen()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Provider.of<AppProvider>(context, listen: true).isDarkMode
              ? AppColors.appDarkModeBack
              : AppColors.appWhite,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: GNav(
              gap: 2,
              activeColor: AppColors.appPrimary,
              iconSize: 24,
              // textStyle: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.black12,
              color: Colors.grey,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'home'.tr(),
                ),
                GButton(
                  icon: Icons.search,
                  text: 'search'.tr(),
                ),
                GButton(
                  icon: Icons.shopping_basket,
                  text: 'cart'.tr(),
                ),
              
                GButton(
                  icon: Icons.person,
                  text: 'profile_bottom'.tr(),
                ),
              ],
              selectedIndex: _page,
              onTabChange: navigationTapped,
            ),
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Theme.of(context).primaryColor,
      //   unselectedItemColor: Colors.grey,
      //   elevation: 20,
      //   type: BottomNavigationBarType.fixed,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined),
      //       // label: 'home_bottom_bar'.tr(),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       // label: 'search_bottom_bar'.tr(),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_basket),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       // label: 'fav_bottom_bar'.tr(),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: '',
      //     ),
      //   ],
      //   onTap: navigationTapped,
      //   currentIndex: _page,
      //   showUnselectedLabels: false,
      //   iconSize: 20,
      // ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) async {
    // if (page == 2) {
    //   await Provider.of<AppProvider>(context, listen: false).getCartList();
    //   await Provider.of<AppProvider>(context, listen: false).getAddressList();
    // }
    // if (page == 3) {
    //   await Provider.of<AppProvider>(context, listen: false).getFavList();
    // }
    // if (page == 0) {
    //   await Provider.of<AppProvider>(context, listen: false).getFavList();
    // }
    // if (page == 4) {
    //   await Provider.of<AppProvider>(context, listen: false).getAddressList();
    // }
    setState(() {
      this._page = page;
    });
  }
}
