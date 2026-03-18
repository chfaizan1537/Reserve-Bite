import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservebite/Routes/routes_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class UserSignupController extends GetxController {
  final name=TextEditingController();
  final email=TextEditingController();
  final password=TextEditingController();
  final confirmpassword=TextEditingController();

  void signup()async{
    final supabase=Supabase.instance.client;
    try{
      if(email.text.isEmpty && password.text.isEmpty){
        Get.snackbar('Error',
            'Please enter required fields',
          backgroundColor: Colors.red.shade300,
          colorText: Colors.white
        );
      }
      else{
        await supabase.auth.signUp(password: password.text,email: email.text,data: {
          'display_name':name.text
        });
      Get.snackbar('Success',
          'User created successfully',
      backgroundColor: Colors.green.shade300,
        colorText: Colors.white
      );
      Get.toNamed(RoutesNames.userlogin);

      }

    }
    catch(e){
      Get.snackbar('Error','$e',
      backgroundColor: Colors.red.shade300,
        colorText: Colors.white
      );

    }

  }


}