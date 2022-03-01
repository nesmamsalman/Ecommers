import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
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
          'Settings'.tr(),
          style: TextStyle(
            fontSize: 20,
            color: AppColors.appPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/settings.png',
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              // items
              Container(
                color:
                    Provider.of<AppProvider>(context, listen: true).isDarkMode
                        ? AppColors.appDarkCard
                        : AppColors.appWhite,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Card(
                  color:
                      Provider.of<AppProvider>(context, listen: true).isDarkMode
                          ? AppColors.appDarkCard
                          : AppColors.appWhite,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      // language
                      Container(
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 50.h
                            : 100.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: InkWell(
                          onTap: () {
                            showMaterialModalBottomSheet(
                              expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
                                decoration: BoxDecoration(
                                    color: Provider.of<AppProvider>(context,
                                                listen: true)
                                            .isDarkMode
                                        ? AppColors.appDarkModeBack
                                        : AppColors.appWhite,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    )),
                                padding: const EdgeInsets.only(top: 20),
                                height: MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? 200.h
                                    : 400.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Language'.tr(),
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Provider.of<AppProvider>(
                                                      context,
                                                      listen: true)
                                                  .isDarkMode
                                              ? AppColors.appWhite
                                              : AppColors.appBlack,
                                        )),
                                    SizedBox(
                                        height: MediaQuery.of(context)
                                                    .orientation ==
                                                Orientation.portrait
                                            ? 10.h
                                            : 20.h),
                                    // en
                                    GestureDetector(
                                      onTap: () {
                                        context.setLocale(Locale('en'));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              color: AppColors.appPrimary,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 35.w,
                                            ),
                                            Text(
                                              'English'.tr(),
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                            .orientation ==
                                                        Orientation.portrait
                                                    ? 16
                                                    : 20,
                                                color: Provider.of<AppProvider>(
                                                            context,
                                                            listen: true)
                                                        .isDarkMode
                                                    ? AppColors.appWhite
                                                    : AppColors.appBlack,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: MediaQuery.of(context)
                                                    .orientation ==
                                                Orientation.portrait
                                            ? 10.h
                                            : 20.h),
                                    const Divider(
                                      height: 1,
                                      color: Color(0xffCCCCCC),
                                      endIndent: 25,
                                      indent: 25,
                                    ),
                                    SizedBox(
                                        height: MediaQuery.of(context)
                                                    .orientation ==
                                                Orientation.portrait
                                            ? 10.h
                                            : 20.h),

                                    // ar
                                    GestureDetector(
                                      onTap: () {
                                        context.setLocale(Locale('ar'));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              color: AppColors.appPrimary,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 35.w,
                                            ),
                                            Text(
                                              'Arabic'.tr(),
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                            .orientation ==
                                                        Orientation.portrait
                                                    ? 16
                                                    : 20,
                                                color: Provider.of<AppProvider>(
                                                            context,
                                                            listen: true)
                                                        .isDarkMode
                                                    ? AppColors.appWhite
                                                    : AppColors.appBlack,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                'Language'.tr(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Provider.of<AppProvider>(context,
                                              listen: true)
                                          .isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                context.locale == Locale('en')
                                    ? 'English'.tr()
                                    : 'Arabic'.tr(),
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xff707070)),
                              ),
                              SizedBox(width: 5.w),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Provider.of<AppProvider>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                size: MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? 20
                                    : 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                          height: 0.5,
                          color: Colors.grey[100],
                          indent: 30,
                          endIndent: 30),

                      // dark mode
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 50.h
                            : 100.h,
                        child: SwitchListTile(
                          activeColor: AppColors.appPrimary,
                          title: Text(
                            'Dark_Mode'.tr(),
                            style: TextStyle(
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          value: Provider.of<AppProvider>(context, listen: true)
                              .isDarkMode,
                          onChanged: (bool value) {
                            Provider.of<AppProvider>(context, listen: false)
                                .changeToDarkMode();
                          },
                        ),
                        //   ],
                        // ),
                      ),
                      Divider(
                          height: 0.5,
                          color: Colors.grey[100],
                          indent: 30,
                          endIndent: 30),

                      // others
                      Container(
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 50.h
                            : 100.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Row(
                          children: [
                            Text(
                              'About_Us'.tr(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Provider.of<AppProvider>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              size: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 20
                                  : 15,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                          height: 0.5,
                          color: Colors.grey[100],
                          indent: 30,
                          endIndent: 30),
                      //
                      Container(
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 50.h
                            : 100.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Row(
                          children: [
                            Text(
                              'Contact_Us'.tr(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Provider.of<AppProvider>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              size: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 20
                                  : 15,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                          height: 0.5,
                          color: Colors.grey[100],
                          indent: 30,
                          endIndent: 30),
                      //
                      Container(
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 50.h
                            : 100.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Row(
                          children: [
                            Text(
                              'Terms_Conditions'.tr(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Provider.of<AppProvider>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              size: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 20
                                  : 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
