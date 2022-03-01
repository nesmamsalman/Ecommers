import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/MyProfileScreen.dart';
import 'package:mns/ui/widgets/CustomButton.dart';
import 'package:provider/provider.dart';

class EditProfieScreen extends StatelessWidget {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController nameController = TextEditingController();
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
          'Editprofile'.tr(),
          style: TextStyle(fontSize: 20, color: AppColors.appPrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // profile avatar
              Container(
                padding: const EdgeInsets.only(bottom: 0),
                alignment: Alignment.bottomCenter,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 120.h
                        : 220.h,
                child: Stack(children: [
                  // Container(
                  //   child: const CircleAvatar(
                  //     radius: 70,
                  //     backgroundImage: NetworkImage(
                  //         'https://ps.w.org/simple-user-avatar/assets/icon-256x256.png?rev=2413146'),
                  //     // 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60'),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<AppProvider>(context, listen: false)
                          .pickNewImage();
                    },
                    child: Provider.of<AppProvider>(context, listen: true)
                                .file ==
                            null
                        ? Provider.of<AppProvider>(context, listen: true)
                                    .imageUrl ==
                                null
                            ? CircleAvatar(
                                radius: 70,
                              )
                            : CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(
                                    Provider.of<AppProvider>(context,
                                            listen: true)
                                        .imageUrl))
                        : CircleAvatar(
                            radius: 70,
                            backgroundImage: FileImage(
                                Provider.of<AppProvider>(context, listen: true)
                                    .file)),
                  ),
                  Container(
                    // height: 133.h,
                    // width: 133.w,
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 133.h
                        : 220.h,
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 120.h
                        : 220.h,
                    alignment: Alignment.bottomRight,
                    child: ClipOval(
                      child: Material(
                        color: AppColors.appPrimary, // Button color
                        child: InkWell(
                          splashColor: Colors.white, // Splash color
                          // splashColor: ThemeConfig.lightAccent,
                          onTap: () {
                            Provider.of<AppProvider>(context, listen: false)
                                .pickNewImage();
                          },
                          child: SizedBox(
                            // width: 26.w,
                            // height: 26.h,
                            width: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 26.h
                                : 46.h,
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 26.h
                                : 46.h,
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 30.h,
              ),
              // enter username
              Text('Username'.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Provider.of<AppProvider>(context, listen: true)
                            .isDarkMode
                        ? AppColors.appWhite
                        : AppColors.appBlack,
                  )),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                autofocus: true,
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
                  hintText: 'Name'.tr(),
                  hintStyle: TextStyle(
                    color: Provider.of<AppProvider>(context, listen: true)
                            .isDarkMode
                        ? AppColors.appWhite
                        : AppColors.appDarksmallTexts,
                  ),
                  suffixIcon: const Icon(
                    Icons.person_outline,
                    color: Color(0xff2C2C2C),
                  ),
                ),
                controller: Provider.of<AppProvider>(context, listen: true)
                    .nameControllerEdit,
              ),
              SizedBox(
                height: 20.h,
              ),
              // enter user email
              Text('Email'.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Provider.of<AppProvider>(context, listen: true)
                            .isDarkMode
                        ? AppColors.appWhite
                        : AppColors.appBlack,
                  )),
              SizedBox(
                height: 10.h,
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
                  suffixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xff2C2C2C),
                  ),
                ),
                controller: Provider.of<AppProvider>(context, listen: true)
                    .emailControllerEdit,
              ),
              SizedBox(
                height: 20.h,
              ),

              // enter user phone
              Text('Mobile_Number'.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Provider.of<AppProvider>(context, listen: true)
                            .isDarkMode
                        ? AppColors.appWhite
                        : AppColors.appBlack,
                  )),
              SizedBox(
                height: 10.h,
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
                  hintText: 'Mobile_Number'.tr(),
                  hintStyle: TextStyle(
                    color: Provider.of<AppProvider>(context, listen: true)
                            .isDarkMode
                        ? AppColors.appWhite
                        : AppColors.appDarksmallTexts,
                  ),
                  suffixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xff2C2C2C),
                  ),
                ),
                controller: Provider.of<AppProvider>(context, listen: true)
                    .phoneControllerEdit,
              ),
              SizedBox(
                height: 20.h,
              ),
              Visibility(
                  visible:
                      Provider.of<AppProvider>(context, listen: true).isLoading,
                  child: Center(
                    child: CircularProgressIndicator(),
                  )),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                title: 'Send'.tr(),
                function: () async {
                  await Provider.of<AppProvider>(context, listen: false)
                      .editProfile();
                  // Navigator.of(context)
                  //     .pushReplacement(MaterialPageRoute(builder: (context) {
                  //   return MyProfileScreen();
                  // }));
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
//   Flexible(
//     flex: 1,
//     child: Container(
//       // height: 40,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: selfPick
//             ? AppColors.appPrimary
//             : const Color(0xff7E7E7E),
//       ),
//       width: double.infinity,
//       padding: const EdgeInsets.only(
//           left: 10, right: 10, top: 0, bottom: 0),
//       child: TextButton(
//         onPressed: () {
//           this.selfPick = true;
//           this.setState(() {});
//           // RouterHelper.routerHelper.routingToSpecificWidget(LoginScreen());
//         },
//         child: Text('Male'.tr(),
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//             )),
//       ),
//     ),
//   ),
//   const SizedBox(
//     width: 10,
//   ),
//   Flexible(
//     flex: 1,
//     child: Container(
//       // height: 40,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: !selfPick
//             ? AppColors.appPrimary
//             : const Color(0xff7E7E7E),
//       ),
//       width: double.infinity,
//       padding: const EdgeInsets.only(
//           left: 10, right: 10, top: 0, bottom: 0),
//       child: TextButton(
//         onPressed: () {
//           this.selfPick = false;
//           this.setState(() {});
//           // RouterHelper.routerHelper.routingToSpecificWidget(LoginScreen());
//         },
//         child: Text('Female'.tr(),
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//             )),
//       ),
//     ),
//   ),
// ],
// ),