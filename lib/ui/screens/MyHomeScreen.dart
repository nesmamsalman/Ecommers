// import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/BestSellerScreen.dart';
import 'package:mns/ui/screens/CategoriesScreen.dart';
import 'package:mns/ui/screens/MySearchScreen.dart';
import 'package:mns/ui/screens/loginRegister.dart';
import 'package:mns/ui/screens/popular.dart';
import 'package:mns/ui/widgets/CategoryWidget.dart';
import 'package:mns/ui/widgets/popular.dart';
import 'package:mns/ui/widgets/productWidget.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:provider/provider.dart';

class MyHomeScreen extends StatelessWidget {
  final List<Color> colors = [
    Colors.grey[50],
    Colors.grey[50],
    Colors.grey[50],
  ];
  final List<String> letters = [
    "https://images.unsplash.com/photo-1552010099-5dc86fcfaa38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
    "https://images.unsplash.com/photo-1625740822008-e45abf4e01d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    "https://images.unsplash.com/photo-1568158879083-c42860933ed7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
  ];

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
      backgroundColor:
          Provider.of<AppProvider>(context, listen: true).isDarkMode
              ? AppColors.appDarkModeBack
              : AppColors.appWhite,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //all content
              SizedBox(
                height: 50,
              ),
              Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(width: 10.w),
                      Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Provider.of<AppProvider>(context, listen: true)
                                        .loggedUser
                                        .imgURL ==
                                    null
                                ? CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                                  )
                                : CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        Provider.of<AppProvider>(context,
                                                listen: true)
                                            .loggedUser
                                            .imgURL)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "Welcome".tr(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.start,
                                    )),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "Our Rika Fashion App",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300),
                                      textAlign: TextAlign.start,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // SizedBox
                      SizedBox(
                        height: 20.h,
                      ),

                      // Categories
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: 10, top: 0, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Categories'.tr(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return CategoriesScreen();
                                // }));
                                RouterHelper.routerHelper
                                    .routingToSpecificWidgetWithoutPop(
                                        CategoriesScreen());
                              },
                              child: Text(
                                'see_all'.tr(),
                                style: TextStyle(
                                    color: Colors.black26, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Provider.of<AppProvider>(context, listen: true)
                                    .allCategories ==
                                null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:
                                    // categ
                                    Provider.of<AppProvider>(context,
                                            listen: true)
                                        .allCategories
                                        .map((e) {
                                  return Container(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Row(children: [CategoryWidget(e)]),
                                  );
                                }).toList(),
                              ),
                      ),

                      // SizedBox
                      SizedBox(
                        height: 20.h,
                      ),

                      // Best sellers
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: 0, top: 0, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New_Arrivals'.tr(),
                              style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return BestSellerScreen();
                                // }));
                                RouterHelper.routerHelper
                                    .routingToSpecificWidgetWithoutPop(
                                        BestSellerScreen());
                              },
                              child: Text(
                                'see_all'.tr(),
                               style: TextStyle(
                                    color: Colors.black26, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(
                            bottom: 0, top: 0, left: 15, right: 0),
                        child: Provider.of<AppProvider>(context, listen: true)
                                    .allProducts ==
                                null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: Provider.of<AppProvider>(context,
                                        listen: true)
                                    .allProducts
                                    .take(4)
                                    .map((e) {
                                  return Container(
                                    child: Row(
                                        children: [productWidget(e, 'home')]),
                                  );
                                }).toList(),
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Popular".tr(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              )),
                          Spacer(),
                          GestureDetector(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PopularScreen()),
                              );
                            }),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'see_all'.tr(),
                                style: TextStyle(
                                    color: Colors.black26, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: 450,
          height: 80,
          child: PopularWidget(
            imageShape: Image.asset("assets/images/Rectangle 26.png"),
            name: "Gia Borghini",
            sup: "RHW Rosie 1 Sandals",
            price: "740.00",
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: 450,
          height: 80,
          child: PopularWidget(
            imageShape: Image.asset("assets/images/Rectangle 27.png"),
            name: "Mansur Gavriel",
            sup: "Oversized Tote",
            price: "695.00",
          ),
        ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
