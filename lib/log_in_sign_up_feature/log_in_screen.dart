import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:skin_scan/password_reset_feature/forgot_password.dart';
import 'package:skin_scan/main.dart';
import '../utilities/bottom_app_bar.dart';
import '../utilities/utility.dart';
import 'log_in_register_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: "Log In"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon:
                  Icon(Icons.email_sharp, color: Color(0xFF283618))),
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                  suffixIcon:
                  Icon(Icons.visibility_off, color: Color(0xFF283618))),
              SizedBox(height: displayHeight(context) * 0.025),
              // GreenButton(buttonText: 'Login',
              //   textSize: displayHeight(context)*0.03,
              //   buttonHeight: displayHeight(context)*0.08,
              //   buttonWidth: displayWidth(context) * 0.7,
              //   onPressed: () {  Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => MyBottomAppBar()));},),


              //SizedBox(height: displayHeight(context) * 0.02),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: displayWidth(context) *0.55,
                  ),
                  Flexible(
                      child: InkWell(
                        child: ReemKufi_Green_Bold(textValue: "Forgot Password?",size: displayHeight(context)* 0.0275),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                        },
                      )
                  ),

                ],
              ),
              SizedBox(height: displayHeight(context) * 0.025),
              GreenButton(buttonText: 'Login',
                textSize: displayHeight(context)*0.03,
                buttonHeight: displayHeight(context)*0.08,
                buttonWidth: displayWidth(context) * 0.7,
                onPressed: () {  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyBottomAppBar()));},
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReemKufi_Green(textValue: "Don't have an account?  ", size: displayHeight(context)* 0.0225),
                    Flexible(
                        child: InkWell(
                          child: ReemKufi_Green_Bold(textValue: "Register",size: displayHeight(context)* 0.025),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LogInRegisterScreen()));
                          },
                        )
                    ),
                  ]
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Padding(
                padding: EdgeInsets.only(
                    left: displayHeight(context) * 0.03,
                    right: displayHeight(context) * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blackLine(),
                    SizedBox(width: displayWidth(context) * 0.01),
                    ReemKufi_Green_Bold(textValue: ' or continue with ', size: displayHeight(context) * 0.03),
                    SizedBox(width: displayWidth(context) * 0.01),
                    blackLine(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: displayHeight(context) * 0.05,
                    right: displayHeight(context) * 0.05),
                child: SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Padding(
                padding: EdgeInsets.only(
                    left: displayHeight(context) * 0.05,
                    right: displayHeight(context) * 0.05),
                child: SignInButton(
                  Buttons.Facebook,
                  text: "Sign up with Facebook",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

