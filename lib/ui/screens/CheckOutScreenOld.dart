// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:grocery_app/provider/app_provider.dart';
// import 'package:grocery_app/theme/AppColors.dart';
// import 'package:grocery_app/ui/screens/AddNewAddressScreen.dart';
// import 'package:grocery_app/ui/widgets/CustomButton.dart';
// // import 'package:im_stepper/main.dart';
// import 'package:im_stepper/stepper.dart';
// import 'package:provider/provider.dart';

// class CheckOutScreenOld extends StatefulWidget {
//   @override
//   _CheckOutScreenOld createState() => _CheckOutScreenOld();
// }

// class _CheckOutScreenOld extends State<CheckOutScreenOld> {
//   int activeStep = 0; // Initial step set to 5.
//   int upperBound = 2; // upperBound MUST BE total number of icons minus 1.

//   bool selfPick = true;
//   bool deliverySpecificTime = true;

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(
//       BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width,
//           maxHeight: MediaQuery.of(context).size.height),
//       // designSize: Size(360, 690),
//       designSize: const Size(411.42857142857144, 797.7142857142857),
//       context: context,
//       minTextAdapt: true,
//       // orientation: Orientation.portrait
//     );
//     return Scaffold(
//       backgroundColor:
//           Provider.of<AppProvider>(context, listen: true).isDarkMode
//               ? AppColors.appDarkModeBack
//               : AppColors.appWhite,
//       appBar: AppBar(
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 color: AppColors.appPrimary,
//                 size: 16,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             );
//           },
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         title: Text(
//           'Check_out'.tr(),
//           style: TextStyle(
//               fontSize: 16,
//               color: AppColors.appPrimary,
//               fontWeight: FontWeight.normal),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 16, right: 16),
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: [
//                 IconStepper(
//                   enableNextPreviousButtons: false,
//                   enableStepTapping: true,
//                   lineColor: AppColors.appPrimary,
//                   lineLength: 100,
//                   lineDotRadius: 0.50,
//                   activeStepColor: AppColors.appPrimary,
//                   stepColor: Colors.grey[50],
//                   icons: const [
//                     Icon(Icons.circle_outlined, color: Colors.white),
//                     Icon(Icons.circle_outlined, color: Colors.white),
//                     Icon(Icons.circle_outlined, color: Colors.white),
//                   ],
//                   // activeStep property set to activeStep variable defined above.
//                   activeStep: activeStep,
//                   // This ensures step-tapping updates the activeStep.
//                   onStepReached: (index) {
//                     setState(() {
//                       activeStep = index;
//                     });
//                   },
//                 ),
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                 const Divider(color: Color(0xffCACACA), height: 10),
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                 // page content
//                 Container(
//                   margin: EdgeInsets.only(bottom: 20),
//                   child: activeStep == 0
//                       ? Delivery()
//                       : activeStep == 1
//                           ? Payment()
//                           : Done(),
//                 ),

//                 Container(
//                   color: Colors.pink,
//                   padding: const EdgeInsets.all(16),
//                   child: Column(mainAxisSize: MainAxisSize.min, children: [
//                     Row(
//                       children: [
//                         Text(
//                           'Total'.tr() + '( 3 items )',
//                           style: const TextStyle(
//                             fontSize: 20,
//                             color: Color(0xff000000),
//                           ),
//                         ),
//                         const Spacer(),
//                         Text(
//                           '320 \$',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: AppColors.appPrimary,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     CustomButton(
//                       title: 'Place order',
//                       function: () {
//                         // GdUser user = GdUser(
//                         //     address: addressController.text,
//                         //     email: emailController.text,
//                         //     name: nameController.text,
//                         //     password: passwordController.text,
//                         //     phone: phoneController.text);
//                         // Provider.of<AppProvider>(context, listen: false).register(user);
//                       },
//                     ),
//                     SizedBox(
//                       height: 5.h,
//                     ),
//                   ]),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // payment Part
//   Widget Payment() {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           //title
//           Text('Select_your_payment_method'.tr(),
//               style: const TextStyle(fontSize: 20, color: Colors.black)),
//           // space
//           SizedBox(
//             height: 10.h,
//           ),
//           // add button
//           // Container(
//           //   decoration: BoxDecoration(
//           //       borderRadius: BorderRadius.circular(30),
//           //       color: const Color(0xffE9F4E4)),
//           //   child: Padding(
//           //     padding: const EdgeInsets.all(8),
//           //     child: Row(
//           //       mainAxisSize: MainAxisSize.min,
//           //       children: [
//           //         SizedBox(width: 15),
//           //         Icon(Icons.add_circle_outline_outlined,
//           //             color: AppColors.appPrimary),
//           //         SizedBox(
//           //           width: 10,
//           //         ),
//           //         Text('Add new payment method',
//           //             style: TextStyle(fontSize: 20, color: AppColors.appPrimary)),
//           //         SizedBox(width: 15),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//           // space
//           SizedBox(
//             height: 10.h,
//           ),
//           // cash on delivery
//           Card(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0)),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Flexible(
//                     flex: 3,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Cash_on_delivery'.tr(),
//                             style: const TextStyle(
//                                 fontSize: 20, color: Colors.black)),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         Text(
//                             context.locale == Locale('en')
//                                 ? 'lorem ispsum dolor sit amet consetetur sadipscing '
//                                 : 'كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر',
//                             style: const TextStyle(
//                                 fontSize: 14, color: Colors.black)),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 5),
//                   Center(
//                       child: InkWell(
//                     onTap: () {},
//                     child: Container(
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: 'dds' != 'dina'
//                               ? AppColors.appPrimary
//                               : Color(0xffF1F1F1)),
//                       child: const Padding(
//                         padding: EdgeInsets.all(5),
//                         child: 'dds' != 'dina'
//                             ? Icon(
//                                 Icons.check,
//                                 size: 25.0,
//                                 color: Colors.white,
//                               )
//                             : Icon(
//                                 Icons.check,
//                                 size: 25.0,
//                                 color: Colors.white,
//                               ),
//                       ),
//                     ),
//                   ))
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   // Delivery Part
//   Widget Delivery() {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           //title
//           Text('Select_delivery_address'.tr(),
//               style: const TextStyle(fontSize: 20, color: Colors.black)),
//           // space
//           SizedBox(
//             height: 10.h,
//           ),
//           // add button
//           GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                 return AddNewAddressScreen('checkOut');
//               }));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   color: const Color(0xffE9F4E4)),
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const SizedBox(width: 15),
//                     Icon(Icons.add_circle_outline_outlined,
//                         color: AppColors.appPrimary),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text('Add_new_address'.tr(),
//                         style: TextStyle(
//                             fontSize: 20, color: AppColors.appPrimary)),
//                     const SizedBox(width: 15),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // space
//           SizedBox(
//             height: 10.h,
//           ),
//           // addresses delivery
//           Container(
//             child: Column(
//               children: Provider.of<AppProvider>(context, listen: true)
//                   .addressList
//                   .map((e) {
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Center(
//                             child: InkWell(
//                           onTap: () {
//                             Provider.of<AppProvider>(context, listen: false)
//                                 .changeDeliveryId(e);
//                           },
//                           child: Container(
//                             // width: 22,
//                             // height: 22,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: e.id ==
//                                         Provider.of<AppProvider>(context,
//                                                 listen: true)
//                                             .deliveryAddressId
//                                     ? AppColors.appPrimary
//                                     : Color(0xffF1F1F1)),
//                             child: Padding(
//                               padding: EdgeInsets.all(5),
//                               child: e.id ==
//                                       Provider.of<AppProvider>(context,
//                                               listen: true)
//                                           .deliveryAddressId
//                                   ? Icon(
//                                       Icons.check,
//                                       size: 25.0,
//                                       color: Colors.white,
//                                     )
//                                   : Icon(
//                                       Icons.check,
//                                       size: 25.0,
//                                       color: Colors.white,
//                                     ),
//                             ),
//                           ),
//                         )),
//                         const SizedBox(width: 10),
//                         Flexible(
//                           flex: 3,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(e.title,
//                                   style: TextStyle(
//                                       fontSize: 20, color: Colors.black)),
//                               const SizedBox(height: 10),
//                               Text(e.description,
//                                   maxLines: 1,
//                                   // context.locale == Locale('en')
//                                   //     ? 'lorem ispsum dolor sit amet consetetur sadipscing '
//                                   //     : 'كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر',
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black,
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//           // space
//           SizedBox(
//             height: 16.h,
//           ),
//           const Divider(color: Color(0xffCACACA), height: 0.5),
//           // space
//           SizedBox(
//             height: 16.h,
//           ),
//           //title
//           Text('Select_method_of_receipt'.tr(),
//               style: const TextStyle(fontSize: 20, color: Colors.black)),
//           SizedBox(
//             height: 16.h,
//           ),
//           //self pick up or seliver buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Flexible(
//                 flex: 1,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: selfPick
//                         ? AppColors.appPrimary
//                         : const Color(0xff7E7E7E),
//                   ),
//                   width: double.infinity,
//                   padding: const EdgeInsets.only(
//                       left: 10, right: 10, top: 0, bottom: 0),
//                   child: TextButton(
//                     onPressed: () {
//                       this.selfPick = true;
//                       this.setState(() {});
//                       // RouterHelper.routerHelper.routingToSpecificWidget(LoginScreen());
//                     },
//                     child: Text('Self-pick_up'.tr(),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         )),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Flexible(
//                 flex: 1,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: !selfPick
//                         ? AppColors.appPrimary
//                         : const Color(0xff7E7E7E),
//                   ),
//                   width: double.infinity,
//                   padding: const EdgeInsets.only(
//                       left: 10, right: 10, top: 0, bottom: 0),
//                   child: TextButton(
//                     onPressed: () {
//                       this.selfPick = false;
//                       this.setState(() {});
//                       // RouterHelper.routerHelper.routingToSpecificWidget(LoginScreen());
//                     },
//                     child: Text('Delivery'.tr(),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         )),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 16.h,
//           ),
//           Container(
//             color: Colors.grey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 selfPick
//                     ? Text('delivery_fee'.tr(),
//                         style: const TextStyle(
//                             fontSize: 14, color: Color(0xff2C2C2C)))
//                     : Container(
//                         child: Column(
//                           children: [
//                             // delivery now card
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('Delivery_now'.tr(),
//                                         style: const TextStyle(
//                                             fontSize: 18, color: Colors.black)),
//                                   ],
//                                 ),
//                                 const Spacer(),
//                                 InkWell(
//                                   onTap: () {
//                                     this.deliverySpecificTime = false;
//                                     this.setState(() {});
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: !deliverySpecificTime
//                                             ? AppColors.appPrimary
//                                             : const Color(0xffF1F1F1)),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(5),
//                                       child: !deliverySpecificTime
//                                           ? const Icon(
//                                               Icons.check,
//                                               size: 22.0,
//                                               color: Colors.white,
//                                             )
//                                           : const Icon(
//                                               Icons.check,
//                                               size: 22.0,
//                                               color: Colors.white,
//                                             ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),

//                             SizedBox(
//                               height: 10.h,
//                             ),

//                             // delivery at specific time card
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('Delivery_specific_time'.tr(),
//                                         style: const TextStyle(
//                                             fontSize: 18, color: Colors.black)),
//                                   ],
//                                 ),
//                                 const Spacer(),
//                                 InkWell(
//                                   onTap: () {
//                                     this.deliverySpecificTime = true;
//                                     this.setState(() {});
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: deliverySpecificTime
//                                             ? AppColors.appPrimary
//                                             : const Color(0xffF1F1F1)),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(5),
//                                       child: deliverySpecificTime
//                                           ? const Icon(
//                                               Icons.check,
//                                               size: 22.0,
//                                               color: Colors.white,
//                                             )
//                                           : const Icon(
//                                               Icons.check,
//                                               size: 22.0,
//                                               color: Colors.white,
//                                             ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),

//                             SizedBox(
//                               height: 20.h,
//                             ),

//                             deliverySpecificTime
//                                 ? Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: <Widget>[
//                                       Flexible(
//                                           child: TextField(
//                                         decoration: InputDecoration(
//                                           focusedBorder: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(33),
//                                             borderSide: const BorderSide(
//                                                 color: Color(0xFFCACACA),
//                                                 width: 1.0),
//                                           ),
//                                           enabledBorder: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(33),
//                                             borderSide: const BorderSide(
//                                                 color: Color(0xFFCACACA),
//                                                 width: 1.0),
//                                           ),
//                                           hintText: 'Date',
//                                           hintStyle: const TextStyle(
//                                               color: Color(0xff2C2C2C)),
//                                           suffixIcon: Icon(
//                                             Icons.calendar_today_outlined,
//                                             color: AppColors.appPrimary,
//                                           ),
//                                         ),
//                                         // controller: emailController,
//                                       )),
//                                       const SizedBox(
//                                         width: 20.0,
//                                       ),
//                                       Flexible(
//                                           child: TextField(
//                                         decoration: InputDecoration(
//                                           focusedBorder: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(33),
//                                             borderSide: const BorderSide(
//                                                 color: Color(0xFFCACACA),
//                                                 width: 1.0),
//                                           ),
//                                           enabledBorder: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(33),
//                                             borderSide: const BorderSide(
//                                                 color: Color(0xFFCACACA),
//                                                 width: 1.0),
//                                           ),
//                                           hintText: 'Time',
//                                           hintStyle: const TextStyle(
//                                               color: Color(0xff2C2C2C)),
//                                           suffixIcon: Icon(
//                                             Icons.timer,
//                                             color: AppColors.appPrimary,
//                                           ),
//                                         ),
//                                         // controller: emailController,
//                                       )),
//                                     ],
//                                   )
//                                 : Container()
//                           ],
//                         ),
//                       )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   // Done
//   Widget Done() {
//     return SingleChildScrollView(
//         child: Center(
//       child: Image.asset('assets/images/ShopDone.png'),
//     ));
//   }
// }



// // Returns the next button.
// // Widget nextButton() {
// //   return ElevatedButton(
// //     onPressed: () {
// //       // Increment activeStep, when the next button is tapped. However, check for upper bound.
// //       if (activeStep < upperBound) {
// //         setState(() {
// //           activeStep++;
// //         });
// //       }
// //     },
// //     child: Text('Next'),
// //   );
// // }
// // Returns the previous button.
// // Widget previousButton() {
// //   return ElevatedButton(
// //     onPressed: () {
// //       // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
// //       if (activeStep > 0) {
// //         setState(() {
// //           activeStep--;
// //         });
// //       }
// //     },
// //     child: Text('Prev'),
// //   );
// // }