import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/models/address_model.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:provider/provider.dart';

class OrderAddressItem extends StatelessWidget {
  AddressModel addressModel;
  OrderAddressItem(this.addressModel);

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
    return Container(
      width: double.infinity,
      // height: 70.h,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? 80.h
          : 150.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Provider.of<AppProvider>(context, listen: true).isDarkMode
            ? AppColors.appDarkCard
            : AppColors.appWhite,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // check button
          Center(
              child: Container(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.my_location_rounded,
                  size: 20.0,
                  color: AppColors.appPrimary,
                )),
          )),
          // detail
          Flexible(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // title + three dots
                    Row(
                      children: [
                        Text(addressModel.title,
                            style: TextStyle(
                              fontSize: 20,
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appBlack,
                            ),
                            maxLines: 1),
                        const Spacer(),
                        // comment
                      ],
                    ),
                    // space
                    SizedBox(
                      height: 10.h,
                    ),
                    // address description
                    Text(
                      addressModel.description,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: Provider.of<AppProvider>(context, listen: true)
                                .isDarkMode
                            ? AppColors.appWhite
                            : AppColors.appDarksmallTexts,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
