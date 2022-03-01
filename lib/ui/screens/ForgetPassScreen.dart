import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/widgets/CustomButton.dart';
import 'package:provider/provider.dart';

class ForgetPassScreen extends StatelessWidget {
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
          'Forget_password'.tr(),
          style: TextStyle(fontSize: 20, color: AppColors.appPrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/fogetPass.png',
                  width: 268.w, height: 300.h),
              SizedBox(
                height: 30.h,
              ),
              Text('Please_enter_you_email'.tr(),
                  style: TextStyle(
                      fontSize: 18,
                      color: Provider.of<AppProvider>(context, listen: true)
                              .isDarkMode
                          ? AppColors.appWhite
                          : AppColors.appBlack,
                      fontWeight: FontWeight.normal)),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                style: TextStyle(
                  color:
                      Provider.of<AppProvider>(context, listen: true).isDarkMode
                          ? AppColors.appWhite
                          : AppColors.appBlack,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide:
                        const BorderSide(color: Color(0xFFCACACA), width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide:
                        const BorderSide(color: Color(0xFFCACACA), width: 1.0),
                  ),
                  hintText: 'Email'.tr(),
                  hintStyle: TextStyle(
                    color: Provider.of<AppProvider>(context, listen: true)
                            .isDarkMode
                        ? AppColors.appWhite
                        : AppColors.appDarksmallTexts,
                  ),
                  suffixIcon: Icon(
                    Icons.email_outlined,
                    color: Provider.of<AppProvider>(context, listen: true)
                            .isDarkMode
                        ? AppColors.appWhite
                        : AppColors.appDarksmallTexts,
                  ),
                ),
                controller: emailController,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                title: 'Send2'.tr(),
                function: () {
                  // GdUser user = GdUser(
                  //     address: addressController.text,
                  //     email: emailController.text,
                  //     name: nameController.text,
                  //     password: passwordController.text,
                  //     phone: phoneController.text);
                  // Provider.of<AppProvider>(context, listen: false).register(user);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
