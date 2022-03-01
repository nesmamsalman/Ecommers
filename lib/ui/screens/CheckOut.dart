import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/models/order_model.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/AddNewAddressScreen.dart';
import 'package:mns/ui/screens/CheckOutDone.dart';
import 'package:mns/ui/screens/CheckOutPayment.dart';
import 'package:mns/ui/widgets/CustomButton.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
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
      // extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.appPrimary,
                size: 16,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Check_out'.tr(),
          style: TextStyle(
            fontSize: 20,
            color: AppColors.appPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // page content
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Text('Select_delivery_address'.tr(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Provider.of<AppProvider>(context, listen: true)
                                  .isDarkMode
                              ? AppColors.appWhite
                              : AppColors.appBlack,
                        )),
                    // space
                    SizedBox(height: 20.h),
                    // add button
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return AddNewAddressScreen('checkOut');
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffE9F4E4)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 15.w),
                              Icon(Icons.add_circle_outline_outlined,
                                  color: AppColors.appPrimary),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text('Add_new_address'.tr(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.appPrimary)),
                              SizedBox(width: 15.w),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // space
                    SizedBox(height: 20.h),
                    // addresses delivery
                    Provider.of<AppProvider>(context, listen: true)
                                .addressList !=
                            null
                        ? Container(
                            child: Column(
                              children: Provider.of<AppProvider>(context,
                                      listen: true)
                                  .addressList
                                  .map((e) {
                                return Card(
                                  color: Provider.of<AppProvider>(context,
                                              listen: true)
                                          .isDarkMode
                                      ? AppColors.appDarkCard
                                      : AppColors.appWhite,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: InkWell(
                                          onTap: () {
                                            Provider.of<AppProvider>(context,
                                                    listen: false)
                                                .changeDeliveryId(e);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: e.id ==
                                                        Provider.of<AppProvider>(
                                                                context,
                                                                listen: true)
                                                            .deliveryAddressId
                                                    ? AppColors.appPrimary
                                                    : Color(0xffF1F1F1)),
                                            child: Padding(
                                              padding: EdgeInsets.all(5),
                                              child: e.id ==
                                                      Provider.of<AppProvider>(
                                                              context,
                                                              listen: true)
                                                          .deliveryAddressId
                                                  ? Icon(
                                                      Icons.check,
                                                      size: 25.0,
                                                      color: Colors.white,
                                                    )
                                                  : Icon(
                                                      Icons.check,
                                                      size: 25.0,
                                                      color: Colors.white,
                                                    ),
                                            ),
                                          ),
                                        )),
                                        SizedBox(width: 10.w),
                                        Flexible(
                                          flex: 3,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(e.title,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Provider.of<
                                                                    AppProvider>(
                                                                context,
                                                                listen: true)
                                                            .isDarkMode
                                                        ? AppColors.appWhite
                                                        : AppColors.appBlack,
                                                  )),
                                              SizedBox(height: 10.h),
                                              Text(e.description,
                                                  maxLines: 1,
                                                  // context.locale == Locale('en')
                                                  //     ? 'lorem ispsum dolor sit amet consetetur sadipscing '
                                                  //     : 'كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Provider.of<
                                                                    AppProvider>(
                                                                context,
                                                                listen: true)
                                                            .isDarkMode
                                                        ? AppColors.appWhite
                                                        : AppColors.appBlack,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Visibility(
                        visible: Provider.of<AppProvider>(context, listen: true)
                            .isLoading,
                        child: Center(
                          child: CircularProgressIndicator(),
                        )),
                    Card(
                      color: Provider.of<AppProvider>(context, listen: true)
                              .isDarkMode
                          ? AppColors.appDarkCard
                          : AppColors.appWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Color(0xffD9ECD1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(16),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Row(
                            children: [
                              Text(
                                'Total '.tr() +
                                    '( ' +
                                    Provider.of<AppProvider>(context,
                                            listen: true)
                                        .cartModelList
                                        .length
                                        .toString() +
                                    ' )',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Provider.of<AppProvider>(context,
                                              listen: true)
                                          .isDarkMode
                                      ? AppColors.appWhite
                                      : AppColors.appBlack,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                Provider.of<AppProvider>(context, listen: true)
                                        .generalTotal
                                        .toString() +
                                    ' \$',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.appPrimary,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20.h),
                          // CustomButton(
                          //   title: 'Proceed_to_payment'.tr(),
                          //   function: () async {
                          //     await Provider.of<AppProvider>(context,
                          //             listen: false)
                          //         .changeisLoadingPayment();

                          //     // Navigator.of(context)
                          //     //     .push(MaterialPageRoute(builder: (context) {
                          //     //   return CheckOutPayment();
                          //     // }));

                          //     RouterHelper.routerHelper
                          //         .routingToSpecificWidgetWithoutPop(
                          //             CheckOutPayment());
                          //   },
                          // ),
                          CustomButton(
                            title: 'Place order',
                            function: () async {
                              OrderModel order = OrderModel(
                                state: "Approved",
                                cardNum: "",
                                expirationDate: "",
                                cvv: "",
                                totalPrice: Provider.of<AppProvider>(context,
                                        listen: false)
                                    .totalPriceInCart
                                    .toString(),
                                cart: Provider.of<AppProvider>(context,
                                        listen: false)
                                    .cartModelList,
                                address: Provider.of<AppProvider>(context,
                                        listen: false)
                                    .deliveryAddress,
                              );

                              await Provider.of<AppProvider>(context,
                                      listen: false)
                                  .addOrder(order);

                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder: (context) {
                              //   return CheckOutDone();
                              // }));
                              RouterHelper.routerHelper
                                  .routingToSpecificWidget(CheckOutDone());
                            },
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
