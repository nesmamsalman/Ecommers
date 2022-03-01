import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/OrderDetailScreen.dart';
import 'package:mns/ui/widgets/OrderItemWidget.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
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
            // Scaffold.of(context).openDrawer();
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
          child: Column(
        children:
            Provider.of<AppProvider>(context, listen: true).ordersList.map((e) {
          return Container(
            margin: const EdgeInsets.only(bottom: 5, left: 16, right: 16),
            child: GestureDetector(
                onTap: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return OrderDetailScreen(e);
                  // }));
                  RouterHelper.routerHelper
                      .routingToSpecificWidgetWithoutPop(OrderDetailScreen(e));
                },
                child: OrderItemWidget(e)),
          );
        }).toList(),
      )),
    );
  }
}
