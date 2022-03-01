import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/models/product_model.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/ProductDetailScreen.dart';
import 'package:provider/provider.dart';

class productWidget extends StatelessWidget {
  ProductModel productItem;
  String from;
  productWidget(this.productItem, this.from);

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
    return GestureDetector(
      onTap: () async {
        ProductModel product =
            await Provider.of<AppProvider>(context, listen: false)
                .getOneProductDetail(productItem.id);

        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return ProductDetailScreen(product);
        // }));

        RouterHelper.routerHelper
            .routingToSpecificWidgetWithoutPop(ProductDetailScreen(product));
      },
      child: Card(
        // margin: EdgeInsets.only(bottom: 10),
        color: Provider.of<AppProvider>(context, listen: true).isDarkMode
            ? AppColors.appDarkCard
            : AppColors.appWhite,
        shadowColor: Colors.black,
        child: Column(
          children: [
            Container(
              width: this.from == "category"
                  ? double.infinity
                  : MediaQuery.of(context).orientation == Orientation.portrait
                      ? 148.w
                      : 100.w,
              // height: 180.h,
              // padding: EdgeInsets.only(bottom: 10),
              child: Container(
                width: double.infinity,
                // height: 180.h,
                child: Stack(
                  children: [
                    // image back + texts
                    Column(
                      children: [
                        //image background
                        Container(
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 100.h
                              : 200.h,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: productItem.imgURL,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(
                                      color: Colors.grey,
                                      strokeWidth: 0.5,
                                      backgroundColor: Colors.grey[200]),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        // texts
                        Container(
                        
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                          child: Column(
                            children: [
                              // name + cart
                              Container(
                                
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.locale == Locale('en')
                                          ? productItem.name
                                          : productItem.name_ar,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Provider.of<AppProvider>(context,
                                                    listen: true)
                                                .isDarkMode
                                            ? AppColors.appWhite
                                            : AppColors.appBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // prices
                              Row(
                                children: [
                                  Text(
                                    productItem.price.toString() + "\$",
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.appPrimary,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                    // top fav button
                    Container(
                      width: double.infinity,
                      // height: 180.h,
                      padding:
                          const EdgeInsets.only(top: 12, right: 12, left: 12),
                      child: ClipOval(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: Colors.white, // Splash color
                            onTap: () {
                              Provider.of<AppProvider>(context, listen: false)
                                      .favList
                                      .any((item) => item.id == productItem.id)
                                  ? Provider.of<AppProvider>(context,
                                          listen: false)
                                      .removeProductFromFav(productItem)
                                  : Provider.of<AppProvider>(context,
                                          listen: false)
                                      .addProductToFav(productItem);
                            },
                            child: SizedBox(
                                width: MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? 26.h
                                    : 46.h,
                                height: MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? 26.h
                                    : 46.h,
                                child: Icon(
                                  Icons.favorite,
                                  color: Provider.of<AppProvider>(context,
                                              listen: true)
                                          .favList
                                          .any((item) =>
                                              item.id == productItem.id)
                                      ? Colors.red
                                      : Colors.grey[300],
                                  size: 16,
                                )),
                          ),
                        ),
                      ),
                      alignment: context.locale == Locale('en')
                          ? Alignment.topRight
                          : Alignment.topLeft,
                    ),

                    // cart button
                    Container(
                      width: double.infinity,
                      // height: 180.h,

                      alignment: context.locale == Locale('en')
                          ? Alignment.bottomRight
                          : Alignment.bottomLeft,
                      padding: EdgeInsets.only(
                          bottom: 14, right: 12, left: 12, top: 120),
                      child: ClipOval(
                        child: Material(
                          color: AppColors.appPrimary, // Button color
                          child: InkWell(
                            splashColor: Colors.white, // Splash color

                            onTap: () {
                              Provider.of<AppProvider>(context, listen: false)
                                  .addProdToCart(productItem);
                            },
                            child: SizedBox(
                              // width: 26.w,
                              // height: 26.h,
                              width: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 26.h
                                  : 46.h,
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 26.h
                                  : 46.h,
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
