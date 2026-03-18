import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservebite/Widgets/custom_container.dart';
import 'package:reservebite/Widgets/custom_elevated_button.dart';
import 'package:reservebite/Widgets/custom_icon_button.dart';
import 'package:get/get.dart';
import 'package:reservebite/Widgets/custom_text.dart';
import 'package:reservebite/Widgets/custom_textfield.dart';
import 'package:reservebite/routes/routes_names.dart';
import 'package:reservebite/widgets/custom_login_container.dart';

import '../../controllers/resturants_controller/resturant_auth_controller.dart';

class ResturantLoginView extends StatefulWidget {
  const ResturantLoginView({super.key});

  @override
  State<ResturantLoginView> createState() => _ResturantLoginViewState();
}

class _ResturantLoginViewState extends State<ResturantLoginView> {
  final Color darkBrown = const Color(0xFF5C3A21);
  final Color mediumBrown = const Color(0xFF8B5A2B);
  final Color lightBrown = const Color(0xFFD9B382);
  final Color cream = const Color(0xFFF5E6D3);
  final Color offWhite = const Color(0xFFFDFAF5);
  final ResturantAuthController controller = Get.put(ResturantAuthController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
gradient: LinearGradient(colors: [
  Color(0xFF8B5A2B),
  Color(0xFF5C3A21),

])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(

          child: Column(
            // mainAxisAlignment: .center,
            children: [
              SizedBox(height: 60,),
              // backbutton
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
             CustomLoginContainer(topcontainericon: Icons.people_alt_outlined,
                 appname: 'Reserve Byte',
                 subtitle: 'Manage Your Reservations ',
                 controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
