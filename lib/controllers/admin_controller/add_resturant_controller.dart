import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddRestaurantController extends GetxController {
  final name = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();

  var openingTime = TimeOfDay(hour: 9, minute: 0).obs;
  var closingTime = TimeOfDay(hour: 21, minute: 0).obs;

  var pickedImage = Rx<File?>(null);

  final SupabaseClient supabase = Supabase.instance.client;


  Future<void> pickOpeningTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: openingTime.value,
    );

    if (picked != null) {
      openingTime.value = picked;
    }
  }

  Future<void> pickClosingTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: closingTime.value,
    );

    if (picked != null) {
      closingTime.value = picked;
    }
  }
  Future<void> pickRestaurantImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }
  String formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  Future<String?> uploadImage(File imageFile) async {
    try {
      final fileName =
          "resturants/${DateTime.now().millisecondsSinceEpoch}.png";

      await supabase.storage
          .from("resturant_images")
          .upload(fileName, imageFile);

      final imageUrl =
      supabase.storage.from("resturant_images").getPublicUrl(fileName);

      Get.snackbar(
        "Success",
        "Image uploaded successfully",
        backgroundColor: Colors.green.shade200,
        colorText: Colors.white,
      );

      return imageUrl;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red.shade200,
        colorText: Colors.white,
      );
      return null;
    }
  }

  Future<void> addRestaurantDetails() async {
    try {
      String? imageUrl;

      if (pickedImage.value != null) {
        imageUrl = await uploadImage(pickedImage.value!);
      }

      await supabase.from("resturants").insert({
        "name": name.text,
        "email": email.text,
        "address": address.text,
        'description':description.text,
        'category':category.text,
        "opening_time": formatTime(openingTime.value),
        "closing_time": formatTime(closingTime.value),
        "image_url": imageUrl ?? "",
      });

      Get.snackbar(
        "Success",
        "Restaurant added successfully",
        backgroundColor: Colors.green.shade200,
        colorText: Colors.white,
      );

      name.clear();
      address.clear();
      category.clear();
      description.clear();
      pickedImage.value = null;

    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red.shade200,
        colorText: Colors.white,
      );
    }
  }
  // In your AddRestaurantController
  Future<void> deleteRestaurant(String id) async {
    try {

       await Supabase.instance.client
          .from('resturants')
          .delete()
          .eq('id', id)
          .select();

      Get.snackbar('Success', 'Restaurant deleted successfully');
    }
  catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}