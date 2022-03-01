import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mns/ui/screens/LoginScreen.dart';
import 'package:mns/ui/screens/loginRegister.dart';
import 'package:mns/ui/screens/sign_up_page.dart';


class SplashScreen02 extends StatelessWidget {
  SplashScreen02({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'image' (group)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/image 02.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.005, -0.59),
            child: SizedBox(
              width: 188.0,
              height: 120.0,
              child:
                  // Adobe XD layer: 'logo' (group)
                  Stack(
                children: <Widget>[
                  // Adobe XD layer: 'logo' (shape)
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 25.0, end: 25.0),
            Pin(size: 115.0, end: 34.0),
            child:
                // Adobe XD layer: 'button' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 50.0, end: 0.0),
                  child: Container(
                    width: 320,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()),
                        );
                      },
                      color: Colors.transparent,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(
                          40.0,
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Mont',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 50.0, start: 0.0),
                  child:
                      // Adobe XD layer: 'button' (group)
                      Container(
                    width: 320,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()),
                        );
                      },
                      color: Colors.white,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Mont',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
