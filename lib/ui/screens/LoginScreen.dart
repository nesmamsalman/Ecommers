import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/ui/widgets/CustomButton.dart';
import 'package:mns/ui/widgets/CustomTextfield.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  register() {
    bool isSuccess = _formKey.currentState.validate();
    if (isSuccess) {
      _formKey.currentState.save();
      Provider.of<AppProvider>(context, listen: false)
          .login(_emailController.text, _passwordController.text);
    }
  }

  passwords(String value) {
    if (value.isEmpty) {
      return 'Please a Enter Password';
    }
    return null;
  }

  emailValidation(String value) {
    if (!isEmail(value)) {
      return 'InCorrect Email syntax';
    }
  }
  String nullValidator(String value) {
    if (value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment(0.154, -1.0),
              child: SizedBox(
                width: 157.0,
                height: 100.0,
                child:
                    // Adobe XD layer: 'logo' (group)
                    Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/log.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Welcome'.tr(),
                style: TextStyle(
                  fontFamily: 'Mont',
                  fontSize: 20,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'please login or sign up to continue our app'.tr(),
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 14,
                    color: const Color(0xff666666),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      bottom: 10.0,
                    ),
                    child: CustomTextfield(
                      labelText: 'Email'.tr(),
                      validationFun: nullValidator,
                      controller: _emailController,
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      bottom: 10.0,
                    ),
                    child: pas(
                      labelText: 'Password'.tr(),
                      validationFun: passwords,
                      controller: _passwordController,
                      textInputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: 'signin'.tr(),
                    function: ()  {
                      bool isSuccess = _formKey.currentState.validate();
                      if (isSuccess) {
                        _formKey.currentState.save();
                        Provider.of<AppProvider>(context, listen: false).login(
                            _emailController.text, _passwordController.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
