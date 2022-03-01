import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/mainAllScreens.dart';
import 'package:mns/models/gd_user.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/ForgetPassScreen.dart';
import 'package:mns/ui/widgets/CustomButton.dart';
import 'package:provider/provider.dart';

class loginRegister extends StatefulWidget {
  @override
  loginRegisterState createState() => loginRegisterState();
}

class loginRegisterState extends State<loginRegister> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailControllerSignUp = TextEditingController();
  TextEditingController passwordControllerSignUp = TextEditingController();
  TextEditingController nameControllerSignUp = TextEditingController();
  TextEditingController phoneControllerSignUp = TextEditingController();

  bool SignUp = true;

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 130
                  : 70,
              left: 16,
              right: 16,
              bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/LogoFill.png',
                  width:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 142.14.w
                          : 180.w,
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 122.01.h
                          : 160.h),
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 30.h
                        : 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      this.SignUp = true;
                      this.setState(() {});
                    },
                    child: Text('Sign_up'.tr(),
                        style: SignUp
                            ? TextStyle(
                                color: AppColors.appPrimary,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.normal)
                            : TextStyle(
                                color: Provider.of<AppProvider>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appDarksmallTexts,
                                fontSize: 20,
                                fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  TextButton(
                    onPressed: () {
                      this.SignUp = false;
                      this.setState(() {});
                    },
                    child: Text('Sign_in'.tr(),
                        style: SignUp
                            ? TextStyle(
                                fontSize: 20,
                                color: Provider.of<AppProvider>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appDarksmallTexts,
                                fontWeight: FontWeight.normal,
                              )
                            : TextStyle(
                                color: AppColors.appPrimary,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              )),
                  ),
                ],
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 20.h
                        : 20.h,
              ),
              Visibility(
                  visible:
                      Provider.of<AppProvider>(context, listen: true).isLoading,
                  child: Center(
                    child: CircularProgressIndicator(),
                  )),
              // SignUp ? SignUpWidgets() : LoginWidgets(),
              SignUp
                  ?
                  // SignUpWidgets
                  Container(
                      child: Column(children: [
                        TextField(
                          style: TextStyle(
                            color:
                                Provider.of<AppProvider>(context, listen: true)
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
                            hintText: 'Name'.tr(),
                            hintStyle: TextStyle(
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appDarksmallTexts,
                            ),
                            suffixIcon: Icon(
                              Icons.person_outline,
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appDarksmallTexts,
                            ),
                          ),
                          controller: nameControllerSignUp,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 10.h
                              : 20.h,
                        ),
                        TextField(
                          style: TextStyle(
                            color:
                                Provider.of<AppProvider>(context, listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appBlack,
                          ),
                          keyboardType: TextInputType.phone,
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
                            hintText: 'Mobile_Number'.tr(),
                            hintStyle: TextStyle(
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appDarksmallTexts,
                            ),
                            suffixIcon: Icon(
                              Icons.phone_outlined,
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appDarksmallTexts,
                            ),
                          ),
                          controller: phoneControllerSignUp,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 10.h
                              : 20.h,
                        ),
                        TextField(
                          style: TextStyle(
                            color:
                                Provider.of<AppProvider>(context, listen: true)
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
                            hintText: 'Email'.tr(),
                            hintStyle: TextStyle(
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appDarksmallTexts,
                            ),
                            suffixIcon: Icon(
                              Icons.email_outlined,
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appDarksmallTexts,
                            ),
                          ),
                          controller: emailControllerSignUp,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 10.h
                              : 20.h,
                        ),
                        TextField(
                          style: TextStyle(
                            color:
                                Provider.of<AppProvider>(context, listen: true)
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
                            hintText: 'Password'.tr(),
                            hintStyle: TextStyle(
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appDarksmallTexts,
                            ),
                            suffixIcon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appDarksmallTexts,
                            ),
                          ),
                          controller: passwordControllerSignUp,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 10.h
                              : 20.h,
                        ),
                        //Terms_Conditions
                        TextButton(
                          onPressed: () {},
                          child: Text('Terms_Conditions'.tr(),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Provider.of<AppProvider>(context,
                                              listen: true)
                                          .isDarkMode
                                      ? AppColors.appWhite
                                      : AppColors.appDarksmallTexts,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.normal)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 10.h
                              : 20.h,
                        ),
                        // signup button
                        CustomButton(
                          title: 'signup'.tr(),
                          function: () async {
                            GdUser user = GdUser(
                                email: emailControllerSignUp.text,
                                name: nameControllerSignUp.text,
                                password: passwordControllerSignUp.text,
                                phone: phoneControllerSignUp.text);
                            // log(emailControllerSignUp.text + "hi ");
                            // log(user.toMap().toString());
                            await Provider.of<AppProvider>(context,
                                    listen: false)
                                .register(user);
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(builder: (context) {
                            //   return MainAllScreens();
                            // }));
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 10.h
                              : 20.h,
                        ),
                      ]),
                    )
                  :
                  // LoginWidgets
                  Container(
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
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
                              hintText: 'Email'.tr(),
                              hintStyle: TextStyle(
                                color: Provider.of<AppProvider>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appDarksmallTexts,
                              ),
                              suffixIcon: Icon(
                                Icons.email_outlined,
                                color: Provider.of<AppProvider>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appDarksmallTexts,
                              ),
                            ),
                            controller: emailController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 10.h
                                : 20.h,
                          ),
                          TextField(
                            style: TextStyle(
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
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
                              hintText: 'Password'.tr(),
                              hintStyle: TextStyle(
                                color: Provider.of<AppProvider>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appDarksmallTexts,
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Provider.of<AppProvider>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appDarksmallTexts,
                              ),
                            ),
                            controller: passwordController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 10.h
                                : 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(builder: (context) {
                                  //   return ForgetPassScreen();
                                  // }));
                                  RouterHelper.routerHelper
                                      .routingToSpecificWidgetWithoutPop(
                                          ForgetPassScreen());
                                },
                                child: Text('Did_you_forget_password'.tr(),
                                    style: TextStyle(
                                      color: Provider.of<AppProvider>(context,
                                                  listen: true)
                                              .isDarkMode
                                          ? AppColors.appWhite
                                          : AppColors.appDarksmallTexts,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    )),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(builder: (context) {
                                  //   return ForgetPassScreen();
                                  // }));
                                  RouterHelper.routerHelper
                                      .routingToSpecificWidgetWithoutPop(
                                          ForgetPassScreen());
                                },
                                child: Text('Forget_password'.tr(),
                                    style: TextStyle(
                                      color: AppColors.appPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.underline,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 10.h
                                : 20.h,
                          ),
                          CustomButton(
                            title: 'signin'.tr(),
                            function: () async {
                              await Provider.of<AppProvider>(context,
                                      listen: false)
                                  .login(emailController.text,
                                      passwordController.text);
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder: (context) {
                              //   return MainAllScreens();
                              // }));
                            },
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
