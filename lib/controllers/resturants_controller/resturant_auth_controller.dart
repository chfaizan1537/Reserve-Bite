import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservebite/Routes/routes_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResturantAuthController extends GetxController {
  final name = TextEditingController();
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
        Get.toNamed(RoutesNames.resturantHomeScreen);

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
}
