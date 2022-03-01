import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/widgets/FavItemWidget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyFavScreen extends StatelessWidget {
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
            'favorite'.tr(),
            style: TextStyle(
              fontSize: 20,
              color: AppColors.appPrimary,
            ),
          ),
        ),
        body: Provider.of<AppProvider>(context, listen: true).favList.isNotEmpty
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(
                    bottom: 0, top: 0, left: 16, right: 16),
                child: Column(
                    children: Provider.of<AppProvider>(context, listen: true)
                        .favList
                        .map((e) {
                  return Container(
                    child: FavItemWidget(e),
                  );
                }).toList()),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/images/FavEmpty2.json',
                      width: 200.w,
                      height: 200.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Your_Favorit_List_is_Empty'.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Provider.of<AppProvider>(context, listen: true)
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
