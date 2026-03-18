import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:reservebite/controllers/user_controllers/showreservations.dart';
import 'package:reservebite/views/user/user_home_view.dart';
import 'package:reservebite/widgets/user/floating_action_button.dart';
import 'package:reservebite/widgets/user/user_see_reservtion_complete_body.dart';

import '../../Routes/routes_names.dart';
import '../../Widgets/custom_icon_button.dart';
import '../../Widgets/custom_text.dart';
import '../../controllers/user_controllers/fetch_reservations.dart';
import '../../controllers/user_controllers/user_login_controller.dart';
import '../../model/reservation_model.dart';
import '../../widgets/custom_icon.dart';
import 'package:get/get.dart';
class UserSeeReservations extends StatefulWidget {
  const UserSeeReservations({super.key});

  @override
  State<UserSeeReservations> createState() => _UserSeeReservationsState();
}

class _UserSeeReservationsState extends State<UserSeeReservations> {

  final UserLoginController controller = Get.put(UserLoginController());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: UserFloatingActionButton(),
      key: scaffoldKey,
      appBar: AppBar(
        title: CustomText(textchild: 'Reserve Bite ',
            style: GoogleFonts.playfairDisplay(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            )

        ),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          scaffoldKey.currentState!.openDrawer();
        }, icon: Icon(Icons.menu,color: Colors.white,size: 30,)),
        backgroundColor: Color(0xFF4A2C1A),
        automaticallyImplyLeading: false,
        actions: [
          CustomIconButton(
            icon: CustomIcon(
              color: Color(0xFFDAF1DE),
              icon: Icons.login_rounded,
              size: 30,
            ),
            onpressed: () {
              controller.logout();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(

              decoration: BoxDecoration(
                  color:Color(0xFF4A2C1A),
                  borderRadius: BorderRadiusGeometry.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
              ),
              child: Center(
                child: Text(
                  "Reserve Bite",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 22),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Card(

                color: Colors.brown.shade100,
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.home,color: Color(0xFF4A2C1A),size: 30,),
                  title: Text("Home",style: GoogleFonts.poppins(fontSize: 18),),
                  onTap:
                      () => Get.toNamed(RoutesNames.userhomescreen),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Card(

                color: Colors.brown.shade100,
                elevation: 4,
                child: ListTile(
                    leading: Icon(Icons.timelapse,color: Color(0xFF4A2C1A),size: 30,),
                    title: Text("Reservations",style: GoogleFonts.poppins(
                        fontSize: 18
                    ),),
                    onTap:(){
Get.toNamed(RoutesNames.userSeeReser);
                    }

                ),
              ),
            ),
          ],

        ),

      ),
       body:UserSeeReservtionCompleteBody(),

    );

  }

}

