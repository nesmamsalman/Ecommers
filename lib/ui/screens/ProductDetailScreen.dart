import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mns/models/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class ProductDetailScreen extends StatelessWidget {
  ProductModel Product;
  ProductDetailScreen(this.Product);
  int amount = 1;

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
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.appPrimary,
              size: 16,
            ),
            onPressed: () {
              Provider.of<AppProvider>(context, listen: false)
                  .clearDefaultAmount();
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            context.locale == Locale('en') ? Product.name : Product.name_ar,
            style: TextStyle(fontSize: 20, color: AppColors.appPrimary),
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 120
                  : 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //top image + shadow
                Container(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 400.h
                          : 600.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      //top image
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: Product.imgURL,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(
                                  color: Colors.grey,
                                  strokeWidth: 0.5,
                                  backgroundColor: Colors.grey[200]),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          width: double.infinity,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 400.h
                              : 600.h,
                        ),
                      ),
                      // top shadow
                      Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                            colors: <Color>[
                              Colors.black.withAlpha(0),
                              Colors.black.withAlpha(0),
                              Colors.black.withAlpha(0),
                              Colors.black87,
                            ],
                          ),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                      ),
                    ],
                  ),
                ),
                // detail of the product + counter
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // product title + counter
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text(
                                context.locale == Locale('en')
                                    ? Product.name
                                    : Product.name_ar,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Provider.of<AppProvider>(context,
                                              listen: true)
                                          .isDarkMode
                                      ? AppColors.appWhite
                                      : AppColors.appBlack,
                                )),
                            Spacer(),
                            // counter container
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Color(0xffDDEED5),
                              ),
                              child: Row(
                                children: [
                                  // dec button
                                  ClipOval(
                                    child: Material(
                                      color: const Color(
                                          0xffB6E8EC), // Button color
                                      child: InkWell(
                                        splashColor:
                                            Colors.white, // Splash color
                                        onTap: () {
                                          Provider.of<AppProvider>(context,
                                                  listen: false)
                                              .decProductAmountInCart();
                                        },
                                        child: SizedBox(
                                            // width: 26.w,
                                            // height: 26.h,
                                            width: MediaQuery.of(context)
                                                        .orientation ==
                                                    Orientation.portrait
                                                ? 26.h
                                                : 46.h,
                                            height: MediaQuery.of(context)
                                                        .orientation ==
                                                    Orientation.portrait
                                                ? 26.h
                                                : 46.h,
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/icons/minus.png'))),
                                      ),
                                    ),
                                  ),
                                  // amount
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child:
                                        // const Center(child: Text('1')),
                                        Center(
                                      child: Text(Provider.of<AppProvider>(
                                              context,
                                              listen: true)
                                          .defaultAmount
                                          .toString()),
                                    ),
                                  ),
                                  // inc button
                                  ClipOval(
                                    child: Material(
                                      color: const Color(
                                          0xffB6E8EC), // Button color
                                      child: InkWell(
                                        splashColor:
                                            Colors.white, // Splash color
                                        onTap: () {
                                          Provider.of<AppProvider>(context,
                                                  listen: false)
                                              .incProductAmountInCart();
                                        },
                                        child: SizedBox(
                                            // width: 26.w,
                                            // height: 26.h,
                                            width: MediaQuery.of(context)
                                                        .orientation ==
                                                    Orientation.portrait
                                                ? 26.h
                                                : 46.h,
                                            height: MediaQuery.of(context)
                                                        .orientation ==
                                                    Orientation.portrait
                                                ? 26.h
                                                : 46.h,
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/icons/plus.png'))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      // price
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Row(
                          children: [
                            Text(
                              Product.price.toString() + " \$",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.appPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // product description
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        child: Text(
                          context.locale == Locale('en')
                              ? 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo'
                              : 'كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن',
                          maxLines: 10,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff7E7E7E)),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
                // bottom buttons

                Visibility(
                    visible: Provider.of<AppProvider>(context, listen: true)
                        .isLoading,
                    child: Center(
                      child: CircularProgressIndicator(),
                    )),

                Container(
                    child: MediaQuery.of(context).orientation !=
                            Orientation.portrait
                        ? Container(
                            color:
                                Provider.of<AppProvider>(context, listen: true)
                                        .isDarkMode
                                    ? AppColors.appDarkModeBack
                                    : AppColors.appWhite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // add to cart button
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      Provider.of<AppProvider>(context,
                                              listen: false)
                                          .addProductToCart(Product);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 20),
                                      height:
                                          MediaQuery.of(context).orientation ==
                                                  Orientation.portrait
                                              ? 60.h
                                              : 100.h,
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: Center(
                                        child: Text(
                                          'Add_to_cart'.tr(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: AppColors.appPrimary,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                // fav button
                                Container(
                                  child: InkWell(
                                    onTap: () async {
                                      await Provider.of<AppProvider>(context,
                                                  listen: false)
                                              .favList
                                              .any((item) =>
                                                  item.id == Product.id)
                                          ? Provider.of<AppProvider>(context,
                                                  listen: false)
                                              .removeProductFromFav(Product)
                                          : Provider.of<AppProvider>(context,
                                                  listen: false)
                                              .addProductToFav(Product);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 20),
                                      height:
                                          MediaQuery.of(context).orientation ==
                                                  Orientation.portrait
                                              ? 60.h
                                              : 100.h,
                                      width:
                                          MediaQuery.of(context).orientation ==
                                                  Orientation.portrait
                                              ? 60.h
                                              : 100.h,
                                      child: Center(
                                          child: Icon(
                                        Icons.favorite,
                                        color: Provider.of<AppProvider>(context,
                                                    listen: true)
                                                .favList
                                                .any((item) =>
                                                    item.id == Product.id)
                                            ? Colors.red
                                            : Colors.grey[400],
                                        // list.contains(x);
                                        size: 30,
                                      )),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffDDEED5),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: 0,
                          ))
              ],
            )),
        bottomSheet: MediaQuery.of(context).orientation == Orientation.portrait
            ? Container(
                color:
                    Provider.of<AppProvider>(context, listen: true).isDarkMode
                        ? AppColors.appDarkModeBack
                        : AppColors.appWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // add to cart button
                    Container(
                      child: InkWell(
                        onTap: () {
                          Provider.of<AppProvider>(context, listen: false)
                              .addProductToCart(Product);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 20),
                          height: 60.h,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Center(
                            child: Text(
                              'Add_to_cart'.tr(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: AppColors.appPrimary,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    // fav button
                    Container(
                      child: InkWell(
                        onTap: () async {
                          await Provider.of<AppProvider>(context, listen: false)
                                  .favList
                                  .any((item) => item.id == Product.id)
                              ? Provider.of<AppProvider>(context, listen: false)
                                  .removeProductFromFav(Product)
                              : Provider.of<AppProvider>(context, listen: false)
                                  .addProductToFav(Product);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 20),
                          height: 60.w,
                          width: 60.w,
                          child: Center(
                              child: Icon(
                            Icons.favorite,
                            color:
                                Provider.of<AppProvider>(context, listen: true)
                                        .favList
                                        .any((item) => item.id == Product.id)
                                    ? Colors.red
                                    : Colors.grey[400],
                            // list.contains(x);
                            size: 30,
                          )),
                          decoration: BoxDecoration(
                              color: const Color(0xffDDEED5),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 0,
              ));
  }
}
