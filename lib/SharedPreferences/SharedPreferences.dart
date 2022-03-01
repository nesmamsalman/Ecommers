import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  // هيك لازم استدعي ميثود الانشاء في المين
  SpHelper._();
  // هادي لو ما بدي اعمل استدعاء في المين
  // SpHelper._() {
  //   initSharedPreferences();
  // }

  static SpHelper spHelper = SpHelper._();

  SharedPreferences sharedPreferences;

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool isFirstTime() {
    bool firstTime = sharedPreferences.getBool('first_time');
    if (firstTime != null && !firstTime) {
      // Not first time
      return false;
    } else {
      // First time
      sharedPreferences.setBool('first_time', false);
      return true;
    }
  }
}
