import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/models/order_model.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/widgets/CustomButton.dart';
import 'package:mns/ui/widgets/OrderAddressItem.dart';
import 'package:mns/ui/widgets/OrderProductItem.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatelessWidget {
  OrderModel orderModel;
  OrderDetailScreen(this.orderModel);

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
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.appPrimary,
            size: 16,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'My_orders'.tr(),
          style: TextStyle(fontSize: 20, color: AppColors.appPrimary),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: Column(children: [
          // Order_ID
          Card(
            color: Provider.of<AppProvider>(context, listen: true).isDarkMode
                ? AppColors.appDarkCard
                : AppColors.appWhite,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Order_ID
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text(
                              'Order_ID'.tr(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Provider.of<AppProvider>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appBlack,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              orderModel.orderID,
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.appPrimary),
                            )
                          ],
                        ),
                      ),
                      // const SizedBox(height: 16),
                      // Payment method
                      // Container(
                      //   width: double.infinity,
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         'Payment_method'.tr(),
                      //         style: const TextStyle(
                      //             fontSize: 18, color: Colors.black),
                      //       ),
                      //       const SizedBox(width: 10),
                      //       // Text(
                      //       //   orderModel.payMethod,
                      //       //   style:   TextStyle(
                      //       //       fontSize: 18, color:AppColors.appPrimary),
                      //       // )
                      //     ],
                      //   ),
                      // ),
                    ],
                  )),
            ),
          ),

          SizedBox(
            height: 10.h,
          ),
          // items + prices
          Card(
            color: Provider.of<AppProvider>(context, listen: true).isDarkMode
                ? AppColors.appDarkCard
                : AppColors.appWhite,
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'items'.tr() +
                        ' ( ' +
                        orderModel.cart.length.toString() +
                        ' ) ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Provider.of<AppProvider>(context, listen: true)
                              .isDarkMode
                          ? AppColors.appWhite
                          : AppColors.appBlack,
                    ),
                  ),
                  // items
                  Container(
                    child: Column(
                        children: orderModel.cart.map((e) {
                      return Container(
                        child: OrderProductItem(e),
                      );
                    }).toList()),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey[200],
                  ),
                  // shipping / prices
                  Container(
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
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Provider.of<AppProvider>(context,
                                              listen: true)
                                          .isDarkMode
                                      ? AppColors.appWhite
                                      : AppColors.appDarksmallTexts,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                orderModel.totalPrice.toString() + '\$',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Provider.of<AppProvider>(context,
                                              listen: true)
                                          .isDarkMode
                                      ? AppColors.appWhite
                                      : AppColors.appDarksmallTexts,
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
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Provider.of<AppProvider>(context,
                                              listen: true)
                                          .isDarkMode
                                      ? AppColors.appWhite
                                      : AppColors.appDarksmallTexts,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '0\$',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Provider.of<AppProvider>(context,
                                              listen: true)
                                          .isDarkMode
                                      ? AppColors.appWhite
                                      : AppColors.appDarksmallTexts,
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
                                orderModel.totalPrice.toString() + '\$',
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
                ],
              ),
            ),
          ),

          SizedBox(
            height: 20.h,
          ),
          // address
          Card(
            color: Provider.of<AppProvider>(context, listen: true).isDarkMode
                ? AppColors.appDarkCard
                : AppColors.appWhite,
            child: OrderAddressItem(orderModel.address),
          ),

          Visibility(
              visible:
                  Provider.of<AppProvider>(context, listen: true).isLoading,
              child: Center(
                child: CircularProgressIndicator(),
              )),

          SizedBox(
            height: 20,
          ),

          CustomButton(
            title: 're_order'.tr(),
            function: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) {
              //   return CheckOutPayment();
              // }));
              Provider.of<AppProvider>(context, listen: false)
                  .reOrder(orderModel);
            },
          ),

          SizedBox(
            height: 20,
          ),
        ]),
      )),
    );
  }
}
