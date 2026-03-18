import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:reservebite/routes/routes_names.dart';
class AdminLoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  void login() async {
    try{
      final supabase = Supabase.instance.client;
      final response = await supabase.auth.signInWithPassword(
        password: password.text,
        email: email.text,
      );
      if(response.user!=null) {
        Get.snackbar('Success', 'Successfully loged In ',
            backgroundColor: Colors.green.shade700,
            colorText: Colors.white
        );
        Get.toNamed(RoutesNames.adminhomescreen);


      }
    }
    catch(e){
      Get.snackbar('Error',
          '$e',
          backgroundColor: Colors.red.shade200,
          colorText: Colors.white
      );

    }

  }
  void logout()async{
    final supabase=Supabase.instance.client;
    try{
      await supabase.auth.signOut();
      Get.snackbar('Success',
          'Successfully loged out ',
          backgroundColor: Colors.green.shade700,
          colorText: Colors.white
      );
      Get.toNamed(RoutesNames.adminloginscreen);

    }
    catch(e){
      Get.snackbar('Error',
          '${e.toString()} ',
          backgroundColor: Colors.red.shade200,
          colorText: Colors.white
      );
    }
  }
}