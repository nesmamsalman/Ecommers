import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/ui/screens/loginRegister.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mns/ui/screens/splash_screen02.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (_) => loginRegister()),
    // );
    RouterHelper.routerHelper.routingToSpecificWidget(SplashScreen02());
  }

  // Widget _buildFullscrenImage() {
  //   return Image.asset(
  //     'assets/images/img1.png',
  //     fit: BoxFit.cover,
  //     height: double.infinity,
  //     width: double.infinity,
  //     alignment: Alignment.center,
  //   );
  // }

  Widget _buildFullscrenImage(String assetName, [double width = 350]) {
    return Pinned.fromPins(
      Pin(start: 15.0, end: 15.0),
      Pin(size: 500.0, start: 20.0),
      child:
          // Adobe XD layer: 'image' (group)
          Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$assetName'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
    // return Image.asset(
    //   'assets/images/$assetName',
    //   fit: BoxFit.cover,
    //   height: double.infinity,
    //   width: double.infinity,
    //   alignment: Alignment.center,
    // );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      // globalHeader: Align(
      //   alignment: Alignment.topRight,
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 16, right: 16),
      //       child: _buildImage('flutter.png', 100),
      //     ),
      //   ),
      // ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "20% Discount\nNew Arrival Product",
          body:
              'Publish up your selfies to make yourself\nmore beautiful with this app.',
          image: _buildFullscrenImage('image 03.png'),
          // decoration: pageDecoration,
          decoration: pageDecoration.copyWith(
            fullScreen: false,
            bodyFlex: -1,
            imageFlex: 2,
            bodyAlignment: Alignment.center,
            pageColor: Color(0xffFFF),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
            bodyTextStyle: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ),
        PageViewModel(
          title: "Take Advantage\nOf The Offer Shopping ",
          body:
              'Publish up your selfies to make yourself\nmore beautiful with this app.',
          image: _buildFullscrenImage('image 04.png'),
          // decoration: pageDecoration,
          decoration: pageDecoration.copyWith(
            fullScreen: false,
            bodyFlex: -1,
            imageFlex: 2,
            bodyAlignment: Alignment.center,
            pageColor: Color(0xffFFF),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
            bodyTextStyle: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ),
        PageViewModel(
          title: "All Types Offers\nWithin Your Reach",
          body:
              'Publish up your selfies to make yourself\nmore beautiful with this app.',
          image: _buildFullscrenImage('image 05.png'),
          // decoration: pageDecoration,
          decoration: pageDecoration.copyWith(
            fullScreen: false,
            bodyFlex: -1,
            imageFlex: 2,
            bodyAlignment: Alignment.center,
            pageColor: Color(0xffFFF),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
            bodyTextStyle: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      // rtl: true, // Display as right-to-left
      skip: Text(
        'Skip'.tr(),
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
      next: Container(
        decoration: BoxDecoration(
          color: const Color(0xff000000),
          borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
        ),
        child: Align(
          alignment: Alignment(2, 0.022),
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: Image.asset('assets/images/arrow.png'),
            // Adobe XD layer: 'Vector' (shape)
          ),
        ),
      ),
      done: Text('Done'.tr(),
          style: const TextStyle(fontSize: 20, color: Colors.black)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: Colors.black,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
