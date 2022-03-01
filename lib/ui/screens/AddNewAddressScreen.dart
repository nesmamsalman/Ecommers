import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/models/address_model.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/CheckOut.dart';
// import 'package:mns/ui/screens/CheckOutScreen.dart';
import 'package:mns/ui/screens/DeliveryAddressScreen.dart';
import 'package:mns/ui/widgets/CustomButton.dart';
import 'package:provider/provider.dart';

class AddNewAddressScreen extends StatefulWidget {
  String comeFrom;
  AddNewAddressScreen(this.comeFrom);

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController streetController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  bool isDefaultAddressOrNot = false;

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
            'Add_new_address'.tr(),
            style: TextStyle(fontSize: 20, color: AppColors.appPrimary),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(children: [
                    // title
                    TextField(
                      style: TextStyle(
                        color: Provider.of<AppProvider>(context, listen: true)
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
                        hintText: 'addTitle'.tr(),
                        hintStyle: TextStyle(
                          color: Provider.of<AppProvider>(context, listen: true)
                                  .isDarkMode
                              ? AppColors.appWhite
                              : AppColors.appDarksmallTexts,
                        ),
                      ),
                      controller: titleController,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    // street
                    TextField(
                      style: TextStyle(
                        color: Provider.of<AppProvider>(context, listen: true)
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
                        hintText: 'street'.tr(),
                        hintStyle: TextStyle(
                          color: Provider.of<AppProvider>(context, listen: true)
                                  .isDarkMode
                              ? AppColors.appWhite
                              : AppColors.appDarksmallTexts,
                        ),
                      ),
                      controller: streetController,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    // country
                    TextField(
                      style: TextStyle(
                        color: Provider.of<AppProvider>(context, listen: true)
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
                        hintText: 'country'.tr(),
                        hintStyle: TextStyle(
                          color: Provider.of<AppProvider>(context, listen: true)
                                  .isDarkMode
                              ? AppColors.appWhite
                              : AppColors.appDarksmallTexts,
                        ),
                      ),
                      controller: countryController,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    // city
                    TextField(
                        style: TextStyle(
                          color: Provider.of<AppProvider>(context, listen: true)
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
                          hintText: 'city'.tr(),
                          hintStyle: TextStyle(
                            color:
                                Provider.of<AppProvider>(context, listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appDarksmallTexts,
                          ),
                        ),
                        controller: cityController),
                    SizedBox(
                      height: 14.h,
                    ),
                    // description
                    Container(
                      height: 5 * 24.0.h,
                      child: TextField(
                          style: TextStyle(
                            color:
                                Provider.of<AppProvider>(context, listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appBlack,
                          ),
                          maxLines: 5,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Color(0xFFCACACA), width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Color(0xFFCACACA), width: 1.0),
                            ),
                            hintText: 'description'.tr(),
                            hintStyle: TextStyle(
                              color: Provider.of<AppProvider>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? AppColors.appWhite
                                  : AppColors.appDarksmallTexts,
                            ),
                          ),
                          controller: descriptionController),
                    ),
                    // make default switch
                    // SwitchListTile(
                    //   activeColor: AppColors.appPrimary,
                    //   title: Text('Make_as_default'.tr()),
                    //   value: this.isDefaultAddressOrNot,
                    //   onChanged: (bool value) {
                    //     isDefaultAddressOrNot = !isDefaultAddressOrNot;
                    //     this.setState(() {});
                    //   },
                    // ),

                    SizedBox(
                      height: 25.h,
                    ),

                    Visibility(
                        visible: Provider.of<AppProvider>(context, listen: true)
                            .isLoading,
                        child: Center(
                          child: CircularProgressIndicator(),
                        )),

                    // signup button
                    CustomButton(
                      title: 'add_address'.tr(),
                      function: () async {
                        AddressModel address = AddressModel(
                          title: titleController.text,
                          street: streetController.text,
                          country: countryController.text,
                          city: cityController.text,
                          description: descriptionController.text,
                          isDefault: isDefaultAddressOrNot,
                        );

                        await Provider.of<AppProvider>(context, listen: false)
                            .addAddress(address);
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (context) {
                        //   return widget.comeFrom == 'deliveryAddresses'
                        //       ? DeliveryAddressScreen()
                        //       : CheckOut();
                        // }));

                        RouterHelper.routerHelper.routingToSpecificWidget(
                            widget.comeFrom == 'deliveryAddresses'
                                ? DeliveryAddressScreen()
                                : CheckOut());
                      },
                    ),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
