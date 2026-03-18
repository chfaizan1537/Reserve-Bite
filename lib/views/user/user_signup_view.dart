import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservebite/controllers/user_controllers/user_signup_controller.dart';
import 'package:get/get.dart';

import '../../Routes/routes_names.dart';
import '../../Widgets/custom_container.dart';
import '../../Widgets/custom_elevated_button.dart';
import '../../Widgets/custom_text.dart';
import '../../Widgets/custom_textfield.dart';
class UserSignupView extends StatefulWidget {
  const UserSignupView({super.key});

  @override
  State<UserSignupView> createState() => _UserSignupViewState();
}

class _UserSignupViewState extends State<UserSignupView> {
  final UserSignupController controller=Get.put(UserSignupController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [

              Color(0xFF8B5A2B),
              Color(0xFF5C3A21)
        ]
        )
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(children: [
                SizedBox(width: 10,),

                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white70,
                      size: 23,
                    ),
                  ),
                  onPressed: (){
                    Get.offNamed(RoutesNames.rolescreen);
                  },
                ),
              ],),

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
                child: const Icon(
                  Icons.restaurant_rounded,
                  color: Colors.white,
                  size: 45,
                ),
              ),
              SizedBox(height: 20,),
              // credentials container
              Padding(
                padding: EdgeInsetsGeometry.only(left: 15, right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: BackdropFilter(

                    filter: ImageFilter.blur(
                        sigmaX: 12,
                        sigmaY: 12
                    ),
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
                            textchild: 'Reserve Bite',
                            style: GoogleFonts.playfairDisplay(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: CupertinoColors.white,
                            ),
                          ),
                          // subtitl
                          Text(
                              'Reserve your perfect dining experience',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white70,
                                height: 1.4,
                              )
                          ),
                          SizedBox(height: 10),
                          // name txt
                          Row(
                            children: [
                              Icon(Icons.person_outline,color: Colors.white70,size: 20,),
                              SizedBox(width: 10),
                              CustomText(
                                textchild: 'Name ',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          //name field
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, right: 10),

                            child: CustomTextfield(
                              controller: controller.name,

                              decoration: InputDecoration(
                                hintText: 'John Doe',
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
                          //email txt
                          Row(
                            children: [
                              Icon(Icons.email_outlined,color: Colors.white70,size: 20,),
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

                            child: CustomTextfield(
                              controller: controller.email,

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
                              Icon(Icons.lock_outline,color: Colors.white70,size: 20,),
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

                            child: CustomTextfield(
                              controller: controller.password,

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
                          SizedBox(height: 20,),

                          Row(

                            children: [
                              Icon(Icons.lock_outline,color: Colors.white70,size: 20,),
                              SizedBox(width: 10),
                              CustomText(
                                textchild: 'Confirm Password ',
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

                            child: CustomTextfield(
                              controller: controller.confirmpassword,

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
                          Row(
                            mainAxisAlignment: .center,
                            children: [
                              TextButton(onPressed: (){
                                Get.toNamed(RoutesNames.userlogin);
                              },
                                  child: Text("Already Have an account? Login"
                                    ,style: GoogleFonts.poppins(
                                      color: Colors.white,fontSize: 15,
                                    ),))
                            ],),
                          //login button
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10,right: 10),
                            child: SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: CustomElevatedButton(styling: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown.shade600,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadiusGeometry.circular(20)
                                  )
                              ),
                                  onpressed: (){
                                    controller.signup();
                                  },
                                  child: CustomText(textchild: 'Signup',
                                      style: GoogleFonts.playfairDisplay(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ))),
                            ),
                          ),
                          SizedBox(height: 10),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
            ],
          ),
        )
      ),
    );
  }
}
