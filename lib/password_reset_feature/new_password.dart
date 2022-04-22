import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/main.dart';
import '../log_in_sign_up_feature/log_in_screen.dart';
import '../utilities/utility.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: "New Password"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'New Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                  suffixIcon:
                  Icon(Icons.visibility_off, color: Color(0xFF283618))),

              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Confirm Password',
                  hintText: 'Re-Enter your password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                  suffixIcon:
                  Icon(Icons.visibility_off, color: Color(0xFF283618))),
              SizedBox(height: displayHeight(context) * 0.05),
              GreenButton(buttonText: 'Change Password',
                textSize: displayHeight(context)*0.03,
                buttonHeight: displayHeight(context)*0.08,
                buttonWidth: displayWidth(context) * 0.7,
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context, // user must tap button!
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: const Color(0xff283618),
                        title: Column(
                          children: [
                            ReemKufiOffwhite(textValue: 'Your Password has been reset', size: displayHeight(context) * 0.04),
                            Icon(Icons.check_circle_outline_outlined, color: Colors.white, size: displayHeight(context) * 0.08,)
                          ],
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xffFFFDF4)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: Text('OK',
                                        style: GoogleFonts.reemKufi(
                                            color: Colors.black,
                                            fontSize:
                                            displayHeight(context) *
                                                0.03)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => LogInScreen()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );

                },),

            ],
          ),
        ),
      ),
    );
  }
}