import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/admin_controller/admin_login_controller.dart';
import '../custom_container.dart';
import '../custom_elevated_button.dart';
import '../custom_icon.dart';
import '../custom_text.dart';
import '../custom_textfield.dart';
import 'package:get/get.dart';
class LoginContainer extends StatefulWidget {
  final String appname;
  final controller;
  final String subtitle;
  final IconData topcontainericon;
  const LoginContainer({super.key,
    required this.topcontainericon,
    required this.appname,
    required this.subtitle,
    required this.controller,

  });

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final AdminLoginController controller = Get.put(AdminLoginController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //resturant icon
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.4),
                width: 2,
              ),
            ),
            child: CustomIcon(
              color: Colors.white,
              icon: widget.topcontainericon,
              size: 45,
            ),
          ),
          SizedBox(height: 20),
          // credentials container
          Padding(
            padding: EdgeInsetsGeometry.only(left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.25),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      // SizedBox(height: 10),
                      // user  name
                      CustomText(
                        textchild: widget.appname,
                        style: GoogleFonts.playfairDisplay(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: CupertinoColors.white,
                        ),
                      ),
                      // subtitl
                      Text(
                        widget.subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white70,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 10),
                      //email txt
                      Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Colors.white70,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          CustomText(
                            textchild: 'Email ',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      //email field
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10, right: 10),

                        child: TextField(
                          controller: widget.controller.email,
                          style: TextStyle(color: Colors.white60),
                          decoration: InputDecoration(
                            hintText: 'john@example.com',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.white54,
                              fontSize: 15,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.3),
                                width: 1.2,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      //password txt
                      Row(
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: Colors.white70,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          CustomText(
                            textchild: 'Password ',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      //passwordfield
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10, right: 10),

                        child: TextField(
                          style: TextStyle(color: Colors.white60),
                          controller: widget.controller.password,

                          decoration: InputDecoration(
                            hintText: '***********',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.white54,
                              fontSize: 15,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.3),
                                width: 1.2,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      //login button
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: CustomElevatedButton(
                            styling: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF5C3A21),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(20),
                              ),
                            ),
                            onpressed: () {
                              widget.controller.login();
                            },
                            child: CustomText(
                              textchild: 'Login',
                              style: GoogleFonts.playfairDisplay(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
