import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/utilities/utility.dart';
import 'view_routine.dart';

class AppBarDetails extends StatefulWidget implements PreferredSizeWidget {
  final String screenName;
  final String subtitle;
  const AppBarDetails(
      {Key? key, required this.screenName, required this.subtitle})
      : super(key: key);

  @override
  _AppBarDetailsState createState() => _AppBarDetailsState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBarDetailsState extends State<AppBarDetails> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFFFFDF4),
          leading: InkWell(
              child: const Icon(Icons.arrow_back),
              onTap: () {
                Navigator.pop(context);
              }),
          title: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: "\n${widget.screenName}",
                  style: GoogleFonts.reemKufi(
                      color: const Color(0xFF4D4D4D),
                      fontSize: displayWidth(context) * 0.05),
                  children: <TextSpan>[
                    TextSpan(
                      text: "\n${widget.subtitle}",
                      style: GoogleFonts.reemKufi(
                          color: const Color(0xFF283618),
                          fontSize: displayHeight(context) * 0.02,
                          fontStyle: FontStyle.italic),
                    )
                  ])),
          iconTheme: const IconThemeData(
            color: Color(0xFF4D4D4D), //change your color here
          )),
    );
  }
}

class AppBar2 extends StatefulWidget implements PreferredSizeWidget {
  final String screenName;
  final String subtitle;
  const AppBar2({Key? key, required this.screenName, required this.subtitle})
      : super(key: key);

  @override
  _AppBar2State createState() => _AppBar2State();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBar2State extends State<AppBar2> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFFFFDF4),
          leading: InkWell(
              child: const Icon(Icons.arrow_back),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ViewRoutine()));
              }),
          title: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: "\n${widget.screenName}",
                  style: GoogleFonts.reemKufi(
                      color: const Color(0xFF4D4D4D),
                      fontSize: displayWidth(context) * 0.05),
                  children: <TextSpan>[
                    TextSpan(
                      text: "\n${widget.subtitle}",
                      style: GoogleFonts.reemKufi(
                          color: const Color(0xFF283618),
                          fontSize: displayHeight(context) * 0.02,
                          fontStyle: FontStyle.italic),
                    )
                  ])),
          iconTheme: const IconThemeData(
            color: Color(0xFF4D4D4D), //change your color here
          )),
    );
  }
}
