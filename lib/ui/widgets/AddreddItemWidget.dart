// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mns/models/address_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/DeliveryAddressEditScreen.dart';
import 'package:provider/provider.dart';

class AddreddItemWidget extends StatelessWidget {
  AddressModel addressModel;
  AddreddItemWidget(this.addressModel);

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
    return Card(
      color: Provider.of<AppProvider>(context, listen: true).isDarkMode
          ? AppColors.appDarkCard
          : AppColors.appWhite,
      margin: const EdgeInsets.only(bottom: 10),
      child: Stack(children: [
        // add info
        Container(
          width: double.infinity,
          // height: 70.h,
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 70.h
              : 150.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // check button
              // Center(
              //     child: InkWell(
              //   onTap: () {},
              //   child: Container(
              //     decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: addressModel.isDefault
              //             ? AppColors.appPrimary,
              //             : const Color(0xffF1F1F1)),
              //     child: Padding(
              //       padding: const EdgeInsets.all(5),
              //       child: addressModel.isDefault
              //           ? const Icon(
              //               Icons.check,
              //               size: 20.0,
              //               color: Colors.white,
              //             )
              //           : const Icon(
              //               Icons.check,
              //               size: 20.0,
              //               color: Colors.white,
              //             ),
              //     ),
              //   ),
              // )),

              Center(
                  child: InkWell(
                onTap: () async {
                  await Provider.of<AppProvider>(context, listen: false)
                      .goToEditAddress(addressModel);
                  // Navigator.of(context)
                  //     .pushReplacement(MaterialPageRoute(builder: (context) {
                  //   return DeliveryAddressEditScreen();
                  // }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.appPrimary,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.edit,
                        size: 20.0,
                        color: Colors.white,
                      )),
                ),
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
                            color:
                                Provider.of<AppProvider>(context, listen: true)
                                        .isDarkMode
                                    ? AppColors.appWhite
                                    : AppColors.appDarksmallTexts,
                          ),
                        ),
                      ],
                    ),
                  )),

              // delete button
              Center(
                  child: InkWell(
                onTap: () async {
                  await Provider.of<AppProvider>(context, listen: false)
                      .removeAddress(addressModel);
                },
                child: Image.asset(
                  'assets/icons/trash.png',
                  fit: BoxFit.scaleDown,
                ),
              )),
            ],
          ),
        ),
      ]),
    );
  }
}


// InkWell(
// onTap: () async {
//   await Provider.of<AppProvider>(context,
//           listen: false)
//       .removeAddress(addressModel);
//   // showMaterialModalBottomSheet(
//   //   expand: false,
//   //   context: context,
//   //   backgroundColor: Colors.transparent,
//   //   builder: (context) => Container(
//   //     decoration: const BoxDecoration(
//   //         color: Colors.white,
//   //         borderRadius: BorderRadius.only(
//   //           topLeft: Radius.circular(20),
//   //           topRight: Radius.circular(20),
//   //         )),
//   //     padding: const EdgeInsets.only(top: 20),
//   //     height: 300,
//   //     child: Column(
//   //       crossAxisAlignment:
//   //           CrossAxisAlignment.center,
//   //       children: [
//   //         Visibility(
//   //             visible: Provider.of<AppProvider>(
//   //                     context,
//   //                     listen: true)
//   //                 .isLoading,
//   //             child: Center(
//   //               child:
//   //                   CircularProgressIndicator(),
//   //             )),
//   //         Text('Address_Settings'.tr(),
//   //             style: const TextStyle(
//   //                 fontSize: 25,
//   //                 color: Colors.black)),
//   //         const SizedBox(height: 20),
//   //         Image.asset(
//   //             'assets/images/addressSettings.png'),
//   //         const SizedBox(height: 20),
//   //         // make default
//   //         // SwitchListTile(
//   //         //   activeColor: AppColors.appPrimary,,
//   //         //   title: Text(
//   //         //       'Make_as_default_address'.tr()),
//   //         //   value: true,
//   //         //   onChanged: (bool value) {},
//   //         //   secondary: const Icon(
//   //         //     Icons.check_box_outlined,
//   //         //     color: AppColors.appPrimary,,
//   //         //   ),
//   //         // ),
//   //         // // divider
//   //         // const Divider(
//   //         //   height: 1,
//   //         //   color: Color(0xffCCCCCC),
//   //         //   endIndent: 25,
//   //         //   indent: 25,
//   //         // // ),
//   //         // const SizedBox(height: 15),
//   //         // edit
//   //         GestureDetector(
//   //           onTap: () {
//   //             Navigator.of(context)
//   //                 .pushReplacement(
//   //                     MaterialPageRoute(
//   //                         builder: (context) {
//   //               return EditDeliveryAddressScreen(
//   //                   addressModel);
//   //             }));
//   //           },
//   //           child: Container(
//   //             padding: const EdgeInsets.only(
//   //                 left: 16, right: 16),
//   //             child: Row(
//   //               children: [
//   //                 const Icon(
//   //                   Icons.edit,
//   //                   color: AppColors.appPrimary,,
//   //                   size: 20,
//   //                 ),
//   //                 const SizedBox(
//   //                   width: 35,
//   //                 ),
//   //                 Text(
//   //                   'Edit'.tr(),
//   //                   style: const TextStyle(
//   //                       fontSize: 16,
//   //                       color: Colors.black),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //         const SizedBox(height: 15),
//   //         // divider
//   //         const Divider(
//   //           height: 2,
//   //           color: Color(0xffCCCCCC),
//   //           endIndent: 25,
//   //           indent: 25,
//   //         ),
//   //         const SizedBox(height: 15),
//   //         // delete
//   //         GestureDetector(
//   //           onTap: () async {
//   //             await Provider.of<AppProvider>(
//   //                     context,
//   //                     listen: false)
//   //                 .removeAddress(addressModel);
//   //           },
//   //           child: Container(
//   //             padding: const EdgeInsets.only(
//   //                 left: 16, right: 16),
//   //             child: Row(
//   //               children: [
//   //                 const Icon(
//   //                   Icons.delete,
//   //                   color: Colors.red,
//   //                   size: 20,
//   //                 ),
//   //                 const SizedBox(
//   //                   width: 35,
//   //                 ),
//   //                 Text(
//   //                   'Delete'.tr(),
//   //                   style: const TextStyle(
//   //                       fontSize: 16,
//   //                       color: Colors.red),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   ),
//   // );
// },
// // child: Icon(Icons.more_horiz_rounded)
// child: Icon(Icons.delete, color: Colors.red))