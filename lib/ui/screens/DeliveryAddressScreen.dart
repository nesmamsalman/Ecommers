import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/mainAllScreens.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/AddNewAddressScreen.dart';
import 'package:mns/ui/screens/MyProfileScreen.dart';
import 'package:mns/ui/widgets/AddreddItemWidget.dart';
import 'package:provider/provider.dart';

class DeliveryAddressScreen extends StatelessWidget {
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
                // Navigator.of(context).pop();
                RouterHelper.routerHelper
                    .routingToSpecificWidget(MainAllScreens());
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              'Delivery_address'.tr(),
              style: TextStyle(fontSize: 20, color: AppColors.appPrimary),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.appPrimary,
                  size: 22,
                ),
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return AddNewAddressScreen('deliveryAddresses');
                  // }));
                  RouterHelper.routerHelper.routingToSpecificWidgetWithoutPop(
                      AddNewAddressScreen('deliveryAddresses'));
                },
              )
            ]),
        body: Provider.of<AppProvider>(context, listen: true).addressList ==
                null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Provider.of<AppProvider>(context, listen: true)
                    .addressList
                    .isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(
                        bottom: 0, top: 0, left: 16, right: 16),
                    child: Column(
                        children:
                            Provider.of<AppProvider>(context, listen: true)
                                .addressList
                                .map((e) {
                      return Container(
                        child: AddreddItemWidget(e),
                      );
                    }).toList()),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 170.h,
                        ),
                        Image.asset(
                          'assets/icons/location.png',
                          width: 200.w,
                          height: 200.h,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        Text(
                          'empty_addresses'.tr(),
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
