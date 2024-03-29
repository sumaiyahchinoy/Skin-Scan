import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/main.dart';
import '../provider/user_provider.dart';
import '../utilities/utility.dart';
import 'my_profile.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  final nameController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    nameController.text =
        context.watch<UserProvider>().getCurrentUser().UserName;

    String currentName =
        context.watch<UserProvider>().getCurrentUser().UserName;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: "Edit Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Container(
                      width: displayHeight(context) * 0.7,
                      child: Column(
                        children: [
                          SizedBox(height: displayHeight(context) * 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ReemKufi_Green(
                                  textValue: "Name",
                                  size: displayHeight(context) * 0.03)
                            ],
                          ),
                          SizedBox(height: displayHeight(context) * 0.03),
                          currentName != ""
                              ? TextFormField(
                                  autofocus: false,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                  ),
                                  controller: nameController,
                                )
                              : TextFormField(
                                  autofocus: false,
                                  cursorColor: Colors.black,
                                  //initialValue: "Please enter your name",
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                  ),
                                  controller: nameController,
                                ),
                          SizedBox(height: displayHeight(context) * 0.06),
                          ReemKufi_Green_Italic(
                              textValue: "Add your name :)",
                              size: displayHeight(context) * 0.025),
                          SizedBox(height: displayHeight(context) * 0.09),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GreenButton(
                            buttonText: 'Save',
                            buttonWidth: displayWidth(context) * 0.3,
                            buttonHeight: displayHeight(context) * 0.07,
                            textSize: displayHeight(context) * 0.03,
                            onPressed: () {
                              String name = nameController.text;

                              Provider.of<UserProvider>(context, listen: false)
                                  .editProfile(name);

                              showDialog(
                                barrierDismissible: false,
                                context: context, // user must tap button!
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: const Color(0xff283618),
                                    title: Text('Changes saved!',
                                        style: GoogleFonts.reemKufi(
                                            color: Color(0xffFFFDF4),
                                            fontSize:
                                                displayHeight(context) * 0.04)),
                                    actions: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffFFFDF4)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Text('OK',
                                                    style: GoogleFonts.reemKufi(
                                                        color: Colors.black,
                                                        fontSize: displayHeight(
                                                                context) *
                                                            0.03)),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }),
                        SizedBox(width: displayHeight(context) * 0.1),
                        GreenButton(
                          buttonWidth: displayWidth(context) * 0.3,
                          buttonHeight: displayHeight(context) * 0.07,
                          buttonText: "Cancel",
                          textSize: displayHeight(context) * 0.03,
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyProfile()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
