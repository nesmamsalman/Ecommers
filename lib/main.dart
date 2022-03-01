import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mns/SharedPreferences/SharedPreferences.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/ui/screens/OnBoardingScreen.dart';
import 'package:mns/ui/screens/SplachScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DatabaseHelper.databaseHelper.initDatabase();
  await SpHelper.spHelper.initSharedPreferences();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          create: (context) {
            return AppProvider();
          },
        ),
      ],
      // ChangeNotifierProvider<AppProvider>(
      //   create: (context) => AppProvider(),
      child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')], //Locale('en'),
          path: 'assets/langs', // <-- change the path of the translation files
          fallbackLocale: const Locale('en'),
          child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: RouterHelper.routerHelper.routerKey,
      home: SplachScreen(),
    );
    return materialApp;
  }
}
