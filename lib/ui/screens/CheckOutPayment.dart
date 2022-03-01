import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/models/order_model.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/CheckOutDone.dart';
import 'package:mns/ui/widgets/CustomButton.dart';
import 'package:provider/provider.dart';

class CheckOutPayment extends StatelessWidget {
  TextEditingController cardNumController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

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
          style: TextStyle(fontSize: 20, color: AppColors.appPrimary),
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
                child: Column(children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    'assets/images/visa.png',
                    height: 200,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  // card num
                  TextField(
                    style: TextStyle(
                      color: Provider.of<AppProvider>(context, listen: true)
                              .isDarkMode
                          ? AppColors.appWhite
                          : AppColors.appBlack,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33),
                        borderSide: const BorderSide(
                            color: Color(0xFFCACACA), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33),
                        borderSide: const BorderSide(
                            color: Color(0xFFCACACA), width: 1.0),
                      ),
                      hintText: 'card_number'.tr(),
                      hintStyle: const TextStyle(color: Color(0xff2C2C2C)),
                    ),
                    controller: cardNumController,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // exp. date
                  TextField(
                    style: TextStyle(
                      color: Provider.of<AppProvider>(context, listen: true)
                              .isDarkMode
                          ? AppColors.appWhite
                          : AppColors.appBlack,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33),
                        borderSide: const BorderSide(
                            color: Color(0xFFCACACA), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33),
                        borderSide: const BorderSide(
                            color: Color(0xFFCACACA), width: 1.0),
                      ),
                      hintText: 'expiration'.tr(),
                      hintStyle: const TextStyle(color: Color(0xff2C2C2C)),
                    ),
                    controller: expirationController,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // cvv
                  TextField(
                    style: TextStyle(
                      color: Provider.of<AppProvider>(context, listen: true)
                              .isDarkMode
                          ? AppColors.appWhite
                          : AppColors.appBlack,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33),
                        borderSide: const BorderSide(
                            color: Color(0xFFCACACA), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33),
                        borderSide: const BorderSide(
                            color: Color(0xFFCACACA), width: 1.0),
                      ),
                      hintText: 'cvv'.tr(),
                      hintStyle: const TextStyle(color: Color(0xff2C2C2C)),
                    ),
                    controller: cvvController,
                  ),

                  Visibility(
                      visible: Provider.of<AppProvider>(context, listen: true)
                          .isLoading,
                      child: Center(
                        child: CircularProgressIndicator(),
                      )),

                  SizedBox(
                    height: 50.h,
                  ),

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
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                        SizedBox(height: 25.h),
                        CustomButton(
                          title: 'Place order',
                          function: () async {
                            OrderModel order = OrderModel(
                              state: "Approved",
                              cardNum: cardNumController.text,
                              expirationDate: expirationController.text,
                              cvv: cvvController.text,
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

                            if ((cardNumController.text != '') &
                                (expirationController.text != '') &
                                (cvvController.text != '')) {
                              await Provider.of<AppProvider>(context,
                                      listen: false)
                                  .addOrder(order);

                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder: (context) {
                              //   return CheckOutDone();
                              // }));
                              RouterHelper.routerHelper
                                  .routingToSpecificWidget(CheckOutDone());
                            }
                          },
                        ),
                      ]),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
