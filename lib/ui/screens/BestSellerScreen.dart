import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/widgets/productWidget.dart';
import 'package:provider/provider.dart';

class BestSellerScreen extends StatelessWidget {
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
          leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: CircleBorder(),
            ),
            child: Image.asset('assets/images/Vector.png'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
            // SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Text(
            //     "Popular",
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            //   ),
            // ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'New_Arrivals'.tr(),
            style: TextStyle(fontSize: 20, color: AppColors.appPrimary),
          ),
        ),
        body: Provider.of<AppProvider>(context, listen: true)
                .allProducts
                .isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0.0),
                shrinkWrap: true,
                itemCount: Provider.of<AppProvider>(context, listen: true)
                    .allProducts
                    .length,
                // itemCount: bestSeller.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 2
                          : 4,
                  // childAspectRatio: 200 / 300,
                  childAspectRatio: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // return productWidget(bestSeller[index], "category");
                  return productWidget(
                      Provider.of<AppProvider>(context, listen: true)
                          .allProducts[index],
                      "category");
                },
              )
            : Center(
                child: Text(
                  'No products to show Now',
                  style: TextStyle(
                    color: Provider.of<AppProvider>(context, listen: true)
                            .isDarkMode
                        ? AppColors.appWhite
                        : AppColors.appBlack,
                  ),
                ),
              ));
  }
}
