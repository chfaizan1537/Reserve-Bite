import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservebite/Widgets/custom_text.dart';
import 'package:reservebite/controllers/admin_controller/admin_login_controller.dart';
import 'package:reservebite/views/admin/add_resturant_button.dart';
import 'package:reservebite/widgets/admin/fetchresturants.dart';
class AdminHomeView extends StatefulWidget {
  const AdminHomeView({super.key});

  @override
  State<AdminHomeView> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  final AdminLoginController controller=Get.put(AdminLoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      floatingActionButton: IconButton(onPressed: (){
controller.logout();
      },
        icon: Icon(Icons.logout,size: 30,),
        color: Colors.black),
      body: Column(
        crossAxisAlignment: .start,
        children: [
           SizedBox(height: 50,),
          // text + iconbutton
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10),
              child: Column(
                children: [
                  CustomText(textchild: 'Resturant Management', style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
                  CustomText(textchild: 'Manage restaurants on platform',
                      style: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                        color:  Color(0xFF5C3A21),
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(right: 10),
              child: Column(
                children: [
                  AddResturantButton()

                ],
              ),
            )
          ],),
          SizedBox(height: 20,),

Padding(
  padding: EdgeInsetsGeometry.only(left: 20),
  child: CustomText(textchild: 'Resturants List',
      style: GoogleFonts.playfairDisplay(
        fontSize: 30,
        fontWeight: FontWeight.bold
      )),
),
          Divider(),
          Fetchresturants()

        ],
      ),
    );
  }
}
