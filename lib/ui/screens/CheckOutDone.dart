import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/mainAllScreens.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/widgets/CustomButton.dart';
import 'package:provider/provider.dart';

class CheckOutDone extends StatelessWidget {
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
      // extendBodyBehindAppBar: true,
      backgroundColor:
          Provider.of<AppProvider>(context, listen: true).isDarkMode
              ? AppColors.appDarkModeBack
              : AppColors.appWhite,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Check_out'.tr(),
          style: TextStyle(fontSize: 20, color: AppColors.appPrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // page content
              SizedBox(height: 90.h),

              Container(
                child: Center(
                  child: Image.asset('assets/images/ShopDone.png'),
                ),
              ),

              SizedBox(height: 50.h),

              CustomButton(
                title: 'go_to_home'.tr(),
                function: () {
                  // Navigator.of(context)
                  //     .pushReplacement(MaterialPageRoute(builder: (context) {
                  //   return MainAllScreens();
                  // }));

                  RouterHelper.routerHelper
                      .routingToSpecificWidget(MainAllScreens());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
