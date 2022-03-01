import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/theme/AppColors.dart';

class CustomButton extends StatelessWidget {
  Function function;
  String title;
  CustomButton({this.function, this.title});

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

    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? 50.h
            : 100.h,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
        ),
        decoration: BoxDecoration(
            color: AppColors.appPrimary,
            borderRadius: BorderRadius.circular(33)),
      ),
    );
  }
}
