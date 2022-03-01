// import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:mns/models/order_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:provider/provider.dart';

class OrderItemWidget extends StatelessWidget {
  OrderModel orderModel;
  OrderItemWidget(this.orderModel);

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
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(14),
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
                          color: Provider.of<AppProvider>(context, listen: true)
                                  .isDarkMode
                              ? AppColors.appWhite
                              : AppColors.appBlack,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        orderModel.orderID,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.appPrimary,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                // delivery icons
                Container(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, //spaceAround
                    children: [
                      // Approved
                      Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              // orderModel.state == 'Approved' ?
                              Image.asset('assets/images/Approved-active.png'),
                              SizedBox(height: 10.h),
                              Text('approved'.tr(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.appPrimary,
                                  )),
                            ],
                          )),

                      // Enroute
                      Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              orderModel.state == 'Enroute'
                                  ? Image.asset(
                                      'assets/images/fast-delivery-active.png')
                                  : Provider.of<AppProvider>(context,
                                              listen: true)
                                          .isDarkMode
                                      ? Image.asset(
                                          'assets/images/fast-delivery-white.png')
                                      : Image.asset(
                                          'assets/images/fast-delivery.png'),
                              SizedBox(height: 10.h),
                              Text('enroute'.tr(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Provider.of<AppProvider>(context,
                                                listen: true)
                                            .isDarkMode
                                        ? AppColors.appWhite
                                        : AppColors.appBlack,
                                  )),
                            ],
                          )),

                      // delivered
                      Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              // orderModel.state == 'Approved' ?
                              Provider.of<AppProvider>(context, listen: true)
                                      .isDarkMode
                                  ? Image.asset(
                                      'assets/images/shipping-white.png')
                                  : Image.asset('assets/images/shipping.png'),
                              SizedBox(height: 10.h),
                              Text('delivered'.tr(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Provider.of<AppProvider>(context,
                                                listen: true)
                                            .isDarkMode
                                        ? AppColors.appWhite
                                        : AppColors.appBlack,
                                  )),
                            ],
                          )),
                    ],
                  ),
                ),

                SizedBox(height: 15.h),
                // divider
                const Divider(
                  height: 3,
                  color: Color(0xffCCCCCC),
                  endIndent: 0,
                  indent: 0,
                ),
                SizedBox(height: 15.h),
                // total price
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        'Total_price'.tr(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Provider.of<AppProvider>(context, listen: true)
                                  .isDarkMode
                              ? AppColors.appWhite
                              : AppColors.appBlack,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        orderModel.totalPrice + "\$",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.appPrimary,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
