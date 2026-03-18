import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservebite/Widgets/custom_icon_button.dart';
import 'package:reservebite/Widgets/custom_text.dart';
import 'package:reservebite/controllers/user_controllers/user_login_controller.dart';
import 'package:reservebite/views/user/custom_resturants_display_card.dart';
import 'package:reservebite/views/user/user_see_reservations.dart';
import 'package:reservebite/widgets/custom_icon.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {

  final UserLoginController controller = Get.put(UserLoginController());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
              decoration: BoxDecoration(color:Color(0xFF4A2C1A),
              borderRadius: BorderRadiusGeometry.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  "Reserve Bite",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Card(
                color: Colors.brown.shade100,
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.home,color: Colors.brown,size: 30,),
                  title: Text("Home",style: GoogleFonts.poppins(
                      fontSize: 20
                  ),),
                  onTap:
                      () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserHomeView(),)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Card(
                color: Colors.brown.shade100,
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.timelapse,color: Colors.brown,size: 30,),
                  title: Text("Reservations",style: GoogleFonts.poppins(
                    fontSize: 20
                  ),),
                  onTap:
                      () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserSeeReservations(),)),
              
                ),
              ),
            ),
          ],

        ),

      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 10),
              CustomText(
                textchild: 'Discover Resturants',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 10),
              CustomText(
                textchild: 'Find your perfect dining experience',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 17,
                  color: Colors.grey.shade700,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          // resturant container
          SizedBox(height: 10),
          ResturantsDisplayCard(),

        ],
      ),
    );
  }
}
