import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/SharedPreferences/SharedPreferences.dart';
import 'package:mns/mainAllScreens.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/OnBoardingScreen.dart';
import 'package:mns/ui/screens/loginRegister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mns/ui/screens/splash_screen02.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((v) async {
      User user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // Navigator.of(context)
        //     .pushReplacement(MaterialPageRoute(builder: (context) {
        //   return SpHelper.spHelper.isFirstTime()
        //       ? OnBoardingScreen()
        //       : loginRegister();
        // }));
        RouterHelper.routerHelper.routingToSpecificWidget(
            SpHelper.spHelper.isFirstTime()
                ? OnBoardingScreen()
                : SplashScreen02());
      } else {
        await Provider.of<AppProvider>(context, listen: false)
            .getUserFromFirebase();
        await Provider.of<AppProvider>(context, listen: false).getData();
        RouterHelper.routerHelper.routingToSpecificWidget(MainAllScreens());
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return MainAllScreens();
        // }));
      }
    });
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(411.42857142857144, 797.7142857142857),
      context: context,
      minTextAdapt: true,
      // orientation: Orientation.portrait
    );
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/image.png'),
                fit: BoxFit.fill,
              ),
            ),
          child: Center(child: Image.asset('assets/images/logo.png')),
        ),
      ),
    );
  }
}
