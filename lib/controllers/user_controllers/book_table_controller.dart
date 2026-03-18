import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class BookingController extends GetxController {
  final supabase = Supabase.instance.client;

  final selectedDate = Rx<DateTime?>(null);
  final selectedTime = RxString('');
  final numberOfGuests = RxInt(2);
  final isLoading = false.obs;

  final specialRequestsController = TextEditingController();


  final List<String> timeSlots = const [
    '17:00', '17:30', '18:00', '18:30', '19:00', '19:30',
    '20:00', '20:30', '21:00', '21:30', '22:00'
  ];

  @override
  void onClose() {
    specialRequestsController.dispose();
    super.onClose();
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
  }

  void updateTime(String time) {
    selectedTime.value = time;
  }

  void updateGuests(int value) {
    numberOfGuests.value = value;
  }


  Future<void> saveBooking(BuildContext context, String restaurantName, String resturantId) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      Get.snackbar(
        'Error',
        'You must be logged in to book a table',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade300,
        colorText: Colors.white,
      );
      return;
    }
    if (selectedDate.value == null) {
      Get.snackbar('Error', 'Please select a date');
      return;
    }
    if (selectedTime.value.isEmpty) {
      Get.snackbar('Error', 'Please select a time');
      return;
    }
    if (numberOfGuests.value < 1) {
      Get.snackbar('Error', 'Please enter valid number of guests');
      return;
    }

    try {
      isLoading.value = true;

      final dateString = selectedDate.value!.toIso8601String();

      await supabase.from('reservation').insert({
        'resturant_name': restaurantName,
        'resturant_id':resturantId,
        'date': dateString,
        'time': selectedTime.value,
        'guests': numberOfGuests.value,
        'note': specialRequestsController.text.isEmpty
            ? null
            : specialRequestsController.text,
        'user_id': user.id,
      });

      Get.snackbar(
        'Success',
        'Booking saved successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );


      selectedDate.value = null;
      selectedTime.value = '';
      numberOfGuests.value = 2;

      specialRequestsController.clear();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error saving booking: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }

  }
}