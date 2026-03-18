import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservebite/routes/routes_names.dart';
import 'package:reservebite/widgets/custom_container.dart';
import 'package:reservebite/widgets/custom_elevated_button.dart';
import 'package:reservebite/widgets/custom_icon.dart';
import 'package:reservebite/widgets/custom_text.dart';

class Rolescreen extends StatefulWidget {
  const Rolescreen({super.key});

  @override
  State<Rolescreen> createState() => _RolescreenState();
}

class _RolescreenState extends State<Rolescreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(

          child: Column(
            children: [
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: .center,
                children: [
                  CustomText(
                    textchild: 'Reserve Bite',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Expanded(
                    child: CustomText(
                      alingment: TextAlign.center,
                      textchild: 'Premium Restaurant Reservations, Elevated',

                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,


                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // user
              Padding(
                padding: EdgeInsetsGeometry.only(left:10,right: 10),
                child: CustomContainer(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentGeometry.topLeft,
                        end: AlignmentGeometry.bottomRight,
                        colors: [
                          Color(0xFFD9B382),
                          Color(0xFF8B5A2B),
                          Color(0xFF5C3A21)
                        ]),
                    borderRadius: BorderRadius.circular(15),


                  ),
                  // width: 00,
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 35,

                        backgroundColor: Color(0xFF5C3A21),
                        child: CustomIcon(
                          color: Colors.white,
                          icon: Icons.restaurant,
                          size: 35,
                        ),
                      ),
                      CustomText(textchild: 'For Users',
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            color: Colors.white
                          )),
                      CustomText(
                          alingment: TextAlign.center,
                          textchild: 'Discover and book exclusive dining experiences',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white70
                            // fontWeight: FontWeight.bold
                          )),
                      CustomElevatedButton(styling: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5C3A21),
                          foregroundColor: Colors.white

                      ), onpressed: (){
                        Get.toNamed(RoutesNames.userlogin);

                      },
                          child: CustomText(textchild: 'Customer Portal',
                              style: GoogleFonts.playfairDisplay(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              )))
                    ],
                  ),),
              ),
              SizedBox(height: 20,),

              // resturant
              Padding(
                padding: EdgeInsetsGeometry.only(left:10,right: 10),
                child: CustomContainer(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentGeometry.topLeft,
                        end: AlignmentGeometry.bottomRight,
                        colors: [
                          Color(0xFFD9B382),
                          Color(0xFF8B5A2B),
                          Color(0xFF5C3A21)
                        ]),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.transparent
                    ),


                  ),
                  // width: 00,
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Color(0xFF5C3A21),
                        child: CustomIcon(
                          color: Colors.white,
                          icon: Icons.people_alt_outlined,
                          size: 35,
                        ),
                      ),
                      CustomText(textchild: 'For Resturants',
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            color: Colors.white
                          )),
                      CustomText(
                          alingment: TextAlign.center,
                          textchild: 'Manage reservations and grow your business',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white70
                            // fontWeight: FontWeight.bold
                          )),
                      CustomElevatedButton(styling: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5C3A21),
                          foregroundColor: Colors.white

                      ), onpressed: (){
                        Get.toNamed(RoutesNames.resturantLogin);
                      },
                          child: CustomText(textchild: "Owner's Dashboard",
                              style: GoogleFonts.playfairDisplay(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              )))
                    ],
                  ),),
              ),

              SizedBox(height: 20,),
              // admin
              Padding(
                padding: EdgeInsetsGeometry.only(left:10,right: 10),
                child: CustomContainer(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentGeometry.topLeft,
                        end: AlignmentGeometry.bottomRight,
                        colors: [
                          Color(0xFFD9B382),
                          Color(0xFF8B5A2B),
                      Color(0xFF5C3A21)
                    ]),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.transparent
                    ),
                    // color:
                    // Color(0xFF8B5A2B),
                  ),

                  width: double.infinity,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Color(0xFF5C3A21),
                        child: CustomIcon(
                          color: Colors.white,
                          icon: Icons.security,
                          size: 35,
                        ),
                      ),
                      CustomText(textchild: 'Administration',
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            color: Colors.white
                          )),
                      CustomText(
                          alingment: TextAlign.center,
                          textchild: 'Platform management and oversight',
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 16,
                              color: Colors.white
                            // fontWeight: FontWeight.bold
                          )),
                      CustomElevatedButton(styling: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5C3A21),
                          foregroundColor: Colors.white

                      ), onpressed: (){
                        Get.toNamed(RoutesNames.adminloginscreen);
                      },
                          child: CustomText(textchild: 'Admin Portal',
                              style: GoogleFonts.playfairDisplay(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              )))
                    ],
                  ),),
              ),
              SizedBox(height: 30,)






            ],
          ),
        ),


      ),
    );
  }
}
