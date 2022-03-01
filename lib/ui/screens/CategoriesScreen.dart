import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/widgets/CategoryWidget.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
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
            'Categories'.tr(),
            style: TextStyle(fontSize: 20, color: AppColors.appPrimary),
          ),
        ),
        body: Provider.of<AppProvider>(context, listen: true)
                .allCategories
                .isNotEmpty
            ? Container(
                padding: EdgeInsets.only(top: 10 , bottom:10 ),
                child: ListView.builder(
                  // padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
                  shrinkWrap: true,
                  itemCount: Provider.of<AppProvider>(context, listen: true)
                      .allCategories
                      .length,
                  // itemCount: categ.length,
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: MediaQuery.of(context).orientation ==
                  //           Orientation.portrait
                  //       ? 3
                  //       : 5,
                  //   // childAspectRatio: 200 / 340,
                  //   childAspectRatio: 9 / 10,
                  // ),
                  itemBuilder: (BuildContext context, int index) {
                    // return CategoryWidget(categ[index]);
                    return CategoryWidget(
                        Provider.of<AppProvider>(context, listen: true)
                            .allCategories[index]);
                  },
                ),
              )
            : Center(
                child: Text(
                  'There is no categories at this moment',
                  style: TextStyle(
                    color: Provider.of<AppProvider>(context, listen: true)
                            .isDarkMode
                        ? AppColors.appWhite
                        : AppColors.appBlack,
                  ),
                ),
              )
              );
  }
}
