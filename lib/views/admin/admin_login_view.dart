import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservebite/widgets/admin/backbutton&text.dart';
import 'package:reservebite/widgets/admin/login_container.dart';

import '../../Routes/routes_names.dart';
import '../../controllers/admin_controller/admin_login_controller.dart';
import '../../widgets/custom_login_container.dart';
class AdminLoginView extends StatefulWidget {
  const AdminLoginView({super.key});

  @override
  State<AdminLoginView> createState() => _AdminLoginViewState();
}

class _AdminLoginViewState extends State<AdminLoginView> {
  final AdminLoginController controller = Get.put(AdminLoginController());
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
        body:  SingleChildScrollView(

          child: Column(
            // mainAxisAlignment: .center,
            children: [
              SizedBox(height: 100,),
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
              LoginContainer(topcontainericon: Icons.security,
                  appname: 'Admin Portal',
                  subtitle: 'Manage Resturants ', controller: controller)
            ],
          ),
        )
      ),
    );
  }
}
