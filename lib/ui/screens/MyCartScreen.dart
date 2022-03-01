import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/CheckOut.dart';
// import 'package:mns/ui/screens/CheckOutScreen.dart';
import 'package:mns/ui/widgets/CartItemWidget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyCartScreen extends StatelessWidget {
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'cart'.tr(),
            style: TextStyle(
              fontSize: 20,
              color: AppColors.appPrimary,
            ),
          ),
        ),
        body: Provider.of<AppProvider>(context, listen: true)
                    // .cartList
                    .cartModelList ==
                null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Provider.of<AppProvider>(context, listen: true)
                    // .cartList
                    .cartModelList
                    .isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(
                        bottom: 0, top: 0, left: 12, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'your_order'.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            color:
                                Provider.of<AppProvider>(context, listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appDarksmallTexts,
                          ),
                        ),
                        Column(
                          children:
                              Provider.of<AppProvider>(context, listen: true)
                                  // .cartList
                                  .cartModelList
                                  .map((e) {
                            return Container(
                              child: CartItemWidget(e),
                            );
                          }).toList(),
                        ),
                        Card(
                          color: Provider.of<AppProvider>(context, listen: true)
                                  .isDarkMode
                              ? AppColors.appDarkCard
                              : AppColors.appWhite,
                          clipBehavior: Clip.hardEdge,
                          child: Container(
                            color: const Color(0xffD9ECD1),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                // Price
                                Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Price'.tr(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff2C2C2C),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        // "100 \$",
                                        Provider.of<AppProvider>(context,
                                                    listen: true)
                                                .totalPriceInCart
                                                .toString() +
                                            '\$',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff2C2C2C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Shipping
                                Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Shipping'.tr(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff2C2C2C),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        // '20 \$',
                                        Provider.of<AppProvider>(context,
                                                    listen: true)
                                                .shippingPrice
                                                .toString() +
                                            '\$',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff2C2C2C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 2,
                                  color: Color(0xffCACACA),
                                ),
                                // Total
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Total'.tr(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: AppColors.appPrimary,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        Provider.of<AppProvider>(context,
                                                    listen: true)
                                                .generalTotal
                                                .toString() +
                                            '\$',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.appPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // bottom buttons
                        Container(
                          child: GestureDetector(
                            onTap: () async {
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return CheckOut();
                              // }));
                              await Provider.of<AppProvider>(context,
                                      listen: false)
                                  .changeisLoadingPayment();

                              RouterHelper.routerHelper
                                  .routingToSpecificWidgetWithoutPop(
                                      CheckOut());
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 20),
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 50.h
                                  : 100.h,
                              child: Center(
                                child: Text(
                                  'Check_out'.tr(),
                                  style: const TextStyle(
                                      color: Color(0xffFFFFFF), fontSize: 20),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.appPrimary,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/images/cartEmpty2.json'),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Your_Cart_is_Empty'.tr(),
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Provider.of<AppProvider>(context, listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appBlack,
                          ),
                        )
                      ],
                    ),
                  ));
  }
}
