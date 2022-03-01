import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/widgets/productWidget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MySearchScreen extends StatelessWidget {
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
          'search'.tr(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
      
        child: Column(
          children: [
            Container(
               child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          height: 50,
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: Color(0xFFF2F2F2),
          ),
          child: TextField(
            cursorColor:Colors.black12,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search , color: Colors.black12,),
              hintText: "Search...".tr()
              //hintStyle: Search,
            
            ),
          ),
        ),
    )
              
            ),
            Provider.of<AppProvider>(context, listen: true)
                    .searchList
                    .isNotEmpty
                ? GridView.builder(
                    // padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
                    shrinkWrap: true,
                    itemCount: Provider.of<AppProvider>(context, listen: true)
                        .searchList
                        .length,
                    physics: const ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 2
                          : 4,
                      childAspectRatio: 1,
                      // childAspectRatio: 200 / 340,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      // return productWidget(bestSeller[index], "category");
                      return productWidget(
                          Provider.of<AppProvider>(context, listen: true)
                              .searchList[index],
                          "category");
                    },
                  )
                : Container(
                    padding: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? EdgeInsets.only(top: 10)
                        : EdgeInsets.only(top: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/images/searchEmpty.json',
                        ),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
