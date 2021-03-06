import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newproject/LoginSignup.dart';
import 'package:newproject/Models/Authentication.dart';
import 'package:newproject/Screens/AuthScreen.dart';
import 'package:newproject/StepModel.dart';

import 'AppDrawer.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<StepModel> list = StepModel.list;
  var _controller = PageController();
  var initialPage = 0;
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        initialPage = _controller.page.round();
      });
    });
    print(initialPage);
    //print(list.length);
    //print((initialPage + 1) / (list.length + 1));
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                  child: Text("PATHFINDER",
                      style: GoogleFonts.encodeSansSemiCondensed(
                          //fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Colors.blueGrey.shade400,
                          letterSpacing: 2.0))),
            ),
            Expanded(
                child: PageView.builder(
                    controller: _controller,
                    itemCount: list.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            SvgPicture.asset(
                              "assets/${list[index].id}.svg",
                              height: 400,
                              //fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                list[index].text,
                                style: GoogleFonts.sairaSemiCondensed(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ],
                        ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 65,
                          height: 65,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.grey),
                            value: (initialPage + 1) / (list.length),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (initialPage < list.length) {
                            _controller.animateToPage(initialPage + 1,
                                duration: Duration(microseconds: 500),
                                curve: Curves.easeIn);
                          }
                          if (initialPage == 3) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Authentication()));
                          }
                        },
                        child: Center(
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                color: Color(0xFFFF9163),
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (initialPage == 3)
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
