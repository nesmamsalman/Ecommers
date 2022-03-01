import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:mns/models/cart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:provider/provider.dart';

class OrderProductItem extends StatelessWidget {
  CartModel Product;
  OrderProductItem(this.Product);

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
        // product info
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 140.h
              : 270.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 120.h
                          : 180.h,
                  width: double.infinity,
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
              Flexible(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 140.h
                        : 250.h,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            // Product.name,
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
                          height: 10.h,
                        ),
                        Text(
                            // Product.description,
                            context.locale == Locale('en')
                                ? Product.product.description
                                : Product.product.description_ar,
                            style: TextStyle(
                              fontSize: 14,
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appDarksmallTexts,
                            ),
                            maxLines: 2),
                        SizedBox(
                          height: 10.h,
                        ),
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
      ]),
    );
  }
}
