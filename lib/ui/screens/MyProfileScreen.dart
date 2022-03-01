// import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/AddNewAddressScreen.dart';
import 'package:mns/ui/screens/DeliveryAddressScreen.dart';
import 'package:mns/ui/screens/EditProfieScreen.dart';
import 'package:mns/ui/screens/MyCartScreen.dart';
import 'package:mns/ui/screens/MyFavScreen.dart';
import 'package:mns/ui/screens/OrdersScreen.dart';
import 'package:mns/ui/screens/SettingScreen.dart';
import 'package:mns/ui/screens/loginRegister.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  build(BuildContext context) {
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
      appBar: AppBar(
        elevation: 0,
        
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'profile'.tr(),
          style: TextStyle(fontSize: 18, color: AppColors.appPrimary),
        ),
        actions: [
          GestureDetector(
              onTap: () async {
                await Provider.of<AppProvider>(context, listen: false)
                    .goToEditProfile();
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return EditProfieScreen();
                // }));
              },
              child: Icon(
                Icons.edit,
                size: 18,
                color: AppColors.appPrimary,
              )),
          SizedBox(
            width: 16,
          )
        ],
      ),
      backgroundColor:
          Provider.of<AppProvider>(context, listen: true).isDarkMode
              ? AppColors.appDarkModeBack
              : AppColors.appWhite,
      body: Provider.of<AppProvider>(context, listen: true).loggedUser == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 12, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    width: 350,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFB6B7B7),
                          offset: Offset(2, 2),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            child:
                                Provider.of<AppProvider>(context, listen: true)
                                            .loggedUser
                                            .imgURL ==
                                        null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                            'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                            Provider.of<AppProvider>(context,
                                                    listen: true)
                                                .loggedUser
                                                .imgURL),
                                      ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    child: Text(
                                  Provider.of<AppProvider>(context,
                                          listen: true)
                                      .loggedUser
                                      .name,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  Provider.of<AppProvider>(context,
                                          listen: true)
                                      .loggedUser
                                      .email,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black38),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFB6B7B7),
                          offset: Offset(2, 2),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                       
                          card(
                            name: "My_orders".tr(),
                            imageShape:
                                Image.asset("assets/images/Vector12.png"),
                            prees: OrdersScreen(),
                          ),
                          card(
                            name: "favorite".tr(),
                            imageShape:
                                Image.asset("assets/images/Vector22.png"),
                            prees: MyFavScreen(),
                          ),
                          card(
                            name: "Delivery_address".tr(),
                            imageShape:
                                Image.asset("assets/images/Vector32.png"),
                            prees: DeliveryAddressScreen(),
                          ),
                          card(
                            name: "cart".tr(),
                            imageShape:
                                Image.asset("assets/images/Vector42.png"),
                            prees: MyCartScreen(),
                          ),
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
                                    height:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.portrait
                                            ? 200.h
                                            : 400.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                    fontSize: MediaQuery.of(
                                                                    context)
                                                                .orientation ==
                                                            Orientation.portrait
                                                        ? 16
                                                        : 20,
                                                    color: Provider.of<
                                                                    AppProvider>(
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
                                                    fontSize: MediaQuery.of(
                                                                    context)
                                                                .orientation ==
                                                            Orientation.portrait
                                                        ? 16
                                                        : 20,
                                                    color: Provider.of<
                                                                    AppProvider>(
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
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      child: Container(
                                        color: Colors.black12,
                                        child: Image.asset(
                                            "assets/images/Vector52.png"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Language'.tr(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
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
                                  
                                  ),
                                  SizedBox(width: 15,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Provider.of<AppProvider>(context, listen: false)
                              .logOut();
                        },
                        child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout_rounded),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Logout'.tr(),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Mont',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),

                  //top image + header
                  // Container(
                  //   width: double.infinity,
                  //   child:
                  // Column(
                  //   children: [
                  //     // profile avatar
                  //     Container(
                  //       margin: MediaQuery.of(context).orientation ==
                  //               Orientation.portrait
                  //           ? EdgeInsets.only(top: 40)
                  //           : EdgeInsets.only(top: 10),
                  //       height: MediaQuery.of(context).orientation ==
                  //               Orientation.portrait
                  //           ? 120.h
                  //           : 220.h,
                  //       padding: const EdgeInsets.only(bottom: 0),
                  //       alignment: Alignment.bottomCenter,
                  //       child: Provider.of<AppProvider>(context, listen: true)
                  //                   .loggedUser
                  //                   .imgURL ==
                  //               null
                  //           ? CircleAvatar(
                  //               radius: 70,
                  //               backgroundImage: NetworkImage(
                  //                   'https://ps.w.org/simple-user-avatar/assets/icon-256x256.png?rev=2413146'),
                  //             )
                  //           : CircleAvatar(
                  //               radius: 70,
                  //               backgroundImage: NetworkImage(
                  //                   Provider.of<AppProvider>(context,
                  //                           listen: true)
                  //                       .loggedUser
                  //                       .imgURL)),
                  //       //  CircleAvatar(
                  //       //   radius: 70,
                  //       //   backgroundImage: NetworkImage(
                  //       //       'https://ps.w.org/simple-user-avatar/assets/icon-256x256.png?rev=2413146'),
                  //       //   // 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60'),
                  //       // ),
                  //     ),
                  //   ],
                  // ),
                  //),
                  // detail
                  // Column(children: [
                  //   Container(
                  //       margin: const EdgeInsets.only(top: 25, bottom: 5),
                  //       child: Text(
                  //         Provider.of<AppProvider>(context, listen: true)
                  //             .loggedUser
                  //             .name,
                  //         style: TextStyle(
                  //             color: Provider.of<AppProvider>(context,
                  //                         listen: true)
                  //                     .isDarkMode
                  //                 ? AppColors.appWhite
                  //                 : AppColors.appBlack,
                  //             fontSize: 20),
                  //       )),
                  //   SizedBox(height: 5.h),
                  //   Container(
                  //       margin: const EdgeInsets.only(top: 5, bottom: 5),
                  //       child: Text(
                  //         Provider.of<AppProvider>(context, listen: true)
                  //             .loggedUser
                  //             .phone,
                  //         style: TextStyle(
                  //             color: Provider.of<AppProvider>(context,
                  //                         listen: true)
                  //                     .isDarkMode
                  //                 ? AppColors.appWhite
                  //                 : AppColors.appDarksmallTexts,
                  //             fontSize: 16),
                  //       )),
                  //   SizedBox(height: 5.h),
                  //   Container(
                  //       margin: const EdgeInsets.only(top: 5, bottom: 5),
                  //       child: Text(
                  //         Provider.of<AppProvider>(context, listen: true)
                  //             .loggedUser
                  //             .email,
                  //         style: TextStyle(
                  //             color: Provider.of<AppProvider>(context,
                  //                         listen: true)
                  //                     .isDarkMode
                  //                 ? AppColors.appWhite
                  //                 : AppColors.appDarksmallTexts,
                  //             fontSize: 16),
                  //       )),
                  // ]),
                  // items
                  // Container(
                  //   margin: const EdgeInsets.symmetric(
                  //       horizontal: 12, vertical: 15),
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  //   child: Card(
                  //     color: Provider.of<AppProvider>(context, listen: true)
                  //             .isDarkMode
                  //         ? AppColors.appDarkCard
                  //         : AppColors.appWhite,
                  //     child: Column(
                  //       children: [
                  //         // orders
                  //         GestureDetector(
                  //           onTap: () async {
                  //             await Provider.of<AppProvider>(context,
                  //                     listen: false)
                  //                 .getOrdersList();
                  //             // Navigator.of(context)
                  //             //     .push(MaterialPageRoute(builder: (context) {
                  //             //   return OrdersScreen();
                  //             // }));
                  //             RouterHelper.routerHelper
                  //                 .routingToSpecificWidgetWithoutPop(
                  //                     OrdersScreen());
                  //           },
                  //           child: Container(
                  //             height: MediaQuery.of(context).orientation ==
                  //                     Orientation.portrait
                  //                 ? 50.h
                  //                 : 100.h,
                  //             padding: const EdgeInsets.symmetric(
                  //                 horizontal: 10, vertical: 0),
                  //             child: Row(
                  //               children: [
                  //                 Icon(
                  //                   Icons.list,
                  //                   color: AppColors.appPrimary,
                  //                   size: 20,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 20.h,
                  //                 ),
                  //                 Text(
                  //                   'My_orders'.tr(),
                  //                   style: TextStyle(
                  //                     fontSize: 16,
                  //                     color: Provider.of<AppProvider>(context,
                  //                                 listen: true)
                  //                             .isDarkMode
                  //                         ? AppColors.appWhite
                  //                         : AppColors.appBlack,
                  //                   ),
                  //                 ),
                  //                 const Spacer(),
                  //                 Icon(
                  //                   Icons.arrow_forward_ios,
                  //                   color: Provider.of<AppProvider>(context,
                  //                               listen: true)
                  //                           .isDarkMode
                  //                       ? Colors.white
                  //                       : Colors.black,
                  //                   size: MediaQuery.of(context).orientation ==
                  //                           Orientation.portrait
                  //                       ? 20
                  //                       : 15,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Divider(
                  //           height: 1,
                  //           color: Colors.grey[100],
                  //           indent: 16,
                  //           endIndent: 16,
                  //         ),

                  //         // addresses list
                  //         GestureDetector(
                  //           onTap: () async {
                  //             // await Provider.of<AppProvider>(context,
                  //             //         listen: false)
                  //             //     .getAddressList();

                  //             // Navigator.of(context)
                  //             //     .push(MaterialPageRoute(builder: (context) {
                  //             //   return DeliveryAddressScreen();
                  //             // }));

                  //             RouterHelper.routerHelper
                  //                 .routingToSpecificWidgetWithoutPop(
                  //                     DeliveryAddressScreen());
                  //           },
                  //           child: Container(
                  //             height: MediaQuery.of(context).orientation ==
                  //                     Orientation.portrait
                  //                 ? 50.h
                  //                 : 100.h,
                  //             padding: const EdgeInsets.symmetric(
                  //                 horizontal: 10, vertical: 0),
                  //             child: Row(
                  //               children: [
                  //                 Icon(
                  //                   Icons.map,
                  //                   color: AppColors.appPrimary,
                  //                   size: 20,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 20.h,
                  //                 ),
                  //                 Text(
                  //                   'Delivery_address'.tr(),
                  //                   style: TextStyle(
                  //                     fontSize: 16,
                  //                     color: Provider.of<AppProvider>(context,
                  //                                 listen: true)
                  //                             .isDarkMode
                  //                         ? AppColors.appWhite
                  //                         : AppColors.appBlack,
                  //                   ),
                  //                 ),
                  //                 const Spacer(),
                  //                 Icon(
                  //                   Icons.arrow_forward_ios,
                  //                   color: Provider.of<AppProvider>(context,
                  //                               listen: true)
                  //                           .isDarkMode
                  //                       ? AppColors.appWhite
                  //                       : AppColors.appBlack,
                  //                   size: MediaQuery.of(context).orientation ==
                  //                           Orientation.portrait
                  //                       ? 20
                  //                       : 15,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Divider(
                  //           height: 1,
                  //           color: Colors.grey[100],
                  //           indent: 16,
                  //           endIndent: 16,
                  //         ),

                  //         // log out
                  //         GestureDetector(
                  //           onTap: () {
                  //             Provider.of<AppProvider>(context, listen: false)
                  //                 .logOut();
                  //             // Navigator.of(context).pushReplacement(
                  //             //     MaterialPageRoute(builder: (context) {
                  //             //   return loginRegister();
                  //             // }));
                  //           },
                  //           child: Container(
                  //             height: MediaQuery.of(context).orientation ==
                  //                     Orientation.portrait
                  //                 ? 50.h
                  //                 : 100.h,
                  //             padding: const EdgeInsets.symmetric(
                  //                 horizontal: 10, vertical: 0),
                  //             child: Row(
                  //               children: [
                  //                 Icon(
                  //                   Icons.logout,
                  //                   color: AppColors.appPrimary,
                  //                   size: 20,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 20.h,
                  //                 ),
                  //                 Text(
                  //                   'Logout'.tr(),
                  //                   style: TextStyle(
                  //                     fontSize: 16,
                  //                     color: Provider.of<AppProvider>(context,
                  //                                 listen: true)
                  //                             .isDarkMode
                  //                         ? AppColors.appWhite
                  //                         : AppColors.appBlack,
                  //                   ),
                  //                 ),
                  //                 // const Spacer(),
                  //                 // Icon(
                  //                 //   Icons.arrow_forward_ios,
                  //                 //   color: Provider.of<AppProvider>(context,
                  //                 //               listen: true)
                  //                 //           .isDarkMode
                  //                 //       ? Colors.white
                  //                 //       : Colors.black,
                  //                 //   size: 20,
                  //                 // ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              )),
    );
  }
}

class card extends StatelessWidget {
  const card({
    Key key,
    String name,
    Widget imageShape,
    Widget prees,
  })  : _name = name,
        _imageShape = imageShape,
        _prees = prees,
        super(key: key);
  final String _name;

  final Widget _imageShape;
  final Widget _prees;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Container(color: Colors.black12, child: _imageShape),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
              child: Text(
            _name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          )),
          SizedBox(
            height: 5,
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _prees),
                );
              },
              icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
