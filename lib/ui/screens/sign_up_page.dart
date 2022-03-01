import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mns/models/gd_user.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/ui/widgets/CustomButton.dart';
import 'package:mns/ui/widgets/CustomTextfield.dart';

import 'package:provider/provider.dart';

import 'package:string_validator/string_validator.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String nullValidator(String value) {
    if (value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  emailValidation(String value) {
    if (!isEmail(value)) {
      return 'InCorrect Email syntax';
    }
  }

  String firstName;

  String email;

  String phoneNumber;

  String address;
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  bool acceptConditions = false;
  String validateCheckBox(v) {
    if (!v) {
      return 'you have to accept our conditions';
    }
    return null;
  }

  void saveCheckBoxResult(bool x) {
    if (x != null) {
      setState(() {
        this.acceptConditions = x;
      });
    }
  }

  passwords(String value) {
    if (value.isEmpty) {
      return 'Please a Enter Password';
    }
    return null;
  }

  confirmpasswords(String value) {
    if (value.isEmpty) {
      return 'Please re-enter password';
    }
    print(password.text);
    print(confirmpassword.text);
    if (password.text != confirmpassword.text) {
      return "Password does not match";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Form(
          key: registerFormKey,
          child: ListView(
            children: [
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
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 50),
                child: Text(
                  'signup'.tr(),
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 20,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    'Create an new account'.tr(),
                    style: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: 14,
                      color: const Color(0xff666666),
                    ),
                  )),
              CustomTextfield(
                labelText: 'Name'.tr(),
                validationFun: nullValidator,
                controller: firstNameController,
              ),
              CustomTextfield(
                labelText: 'Email'.tr(),
                validationFun: emailValidation,
                controller: emailController,
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextfield(
                labelText: 'Mobile_Number'.tr(),
                validationFun: nullValidator,
                controller: phoneController,
                textInputType: TextInputType.number,
              ),
              pas(
                labelText: 'Password'.tr(),
                validationFun: passwords,
                controller: password,
                textInputType: TextInputType.text,
              ),
              pas(
                labelText: 'Confirm_Password'.tr(),
                validationFun: confirmpasswords,
                controller: confirmpassword,
                textInputType: TextInputType.text,
              ),

              /*FormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  builder: (state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                            title: Text('Accept conditions'),
                            value: acceptConditions,
                            onChanged: (v) {
                              this.acceptConditions = v;
                              state.didChange(v);
                              setState(() {});
                            }),
                        Text(
                          state.errorText  '',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    );
                  }),*/
              SizedBox(
                height: 30,
              ),
              CustomButton(
                title: 'signup'.tr(),
                function: () {
                  bool isSuccess = registerFormKey.currentState.validate();
                  if (isSuccess) {
                    registerFormKey.currentState.save();
                    log(firstNameController.text);
                    GdUser user = GdUser(
                        email: emailController.text,
                        name: firstNameController.text,
                        password: password.text,
                        confirmpassword:confirmpassword.text,
                        phone: phoneController.text);
                     log(emailController.text + "hi ");
                    log(user.toMap().toString());
                    Provider.of<AppProvider>(context, listen: false)
                        .register(user);
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(builder: (context) {
                    //   return MainAllScreens();
                    // }));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
