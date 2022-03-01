import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:mns/models/cart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  CartModel Product;
  CartItemWidget(this.Product);

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
    return Card(
      color: Provider.of<AppProvider>(context, listen: true).isDarkMode
          ? AppColors.appDarkCard
          : AppColors.appWhite,
      child: Stack(children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 120.h
              : 220.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // product image
              Flexible(
                child: Container(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 100.h
                          : 210.h,
                  width:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 100.w
                          : 180.w,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: Product.product.imgURL,
                      placeholder: (context, url) => CircularProgressIndicator(
                          color: Colors.grey,
                          strokeWidth: 0.5,
                          backgroundColor: Colors.grey[200]),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),

              // product detail
              Flexible(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 100.h
                        : 210.h,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // product name
                        Text(
                            context.locale == Locale('en')
                                ? Product.product.name
                                : Product.product.name_ar,
                            style: TextStyle(
                              fontSize: 20,
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appBlack,
                            ),
                            maxLines: 1),
                        SizedBox(
                          height: 15.h,
                        ),
                        // product price
                        Text(
                          Product.product.price.toString() + "\$",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.appPrimary,
                          ),
                          maxLines: 3,
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),

        //delete button
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 120.h
              : 220.h,
          alignment: context.locale == Locale('en')
              ? Alignment.topRight
              : Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: ClipOval(
            child: Material(
              color: Colors.grey[50], // Button color
              child: InkWell(
                splashColor: Colors.white, // Splash color
                onTap: () {
                  Provider.of<AppProvider>(context, listen: false)
                      .removeProductFromCart(Product);
                },
                child: SizedBox(
                  width:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 26.h
                          : 46.h,
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 26.h
                          : 46.h,
                  child: Image.asset(
                    'assets/icons/trash.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ),

        // plus minus button
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? 120.h
                : 220.h,
            alignment: context.locale == Locale('en')
                ? Alignment.bottomRight
                : Alignment.bottomLeft,
            padding: const EdgeInsets.all(5),
            child: Container(
              padding: const EdgeInsets.all(5),
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 50.h
                  : 100.h,
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 90.w
                  : 50.w,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  // color: Color(0xffFFFFFF),
                  color: Color(0xffD9ECD1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // minus button
                  ClipOval(
                    child: Material(
                      color: const Color(0xffFFFFFF), // Button color
                      child: InkWell(
                        splashColor: Colors.white, // Splash color
                        onTap: () {
                          Provider.of<AppProvider>(context, listen: false)
                              .decProdAmountInCartScreen(Product);
                        },
                        child: SizedBox(
                            // width: 22.w,
                            // height: 22.h,
                            width: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 22.h
                                : 42.h,
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 22.h
                                : 42.h,
                            child: Image(
                                image: AssetImage('assets/icons/minus.png'))),
                      ),
                    ),
                  ),
                  // amount
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(child: Text(Product.amount.toString())),
                  ),

                  // plus button
                  ClipOval(
                    child: Material(
                      color: Color(0xffFFFFFF), // Button color
                      child: InkWell(
                        splashColor: Colors.white, // Splash color
                        onTap: () {
                          Provider.of<AppProvider>(context, listen: false)
                              .incProdAmountInCartScreen(Product);
                        },
                        child: SizedBox(
                            width: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 22.h
                                : 42.h,
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 22.h
                                : 42.h,
                            child: Image(
                                image: AssetImage('assets/icons/plus.png'))),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ]),
    );
  }
}
