import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class FetchReservationController extends GetxController {
  var restaurantData = Rx<Map<String, dynamic>>({});
  var reservations = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  String get restaurantName => restaurantData.value['name'] ?? 'Restaurant';

  void fetchreservations() async {
    final supabase = Supabase.instance.client;
    final currentuser = supabase.auth.currentUser;
    final restaurantEmail = currentuser!.email;

    try {
      isLoading.value = true;

      final response = await supabase
          .from('resturants')
          .select('''
            id,
            name,
            email,
            category,
            address,
            reservation!resturant_id(
              id,
              resturant_name,
              date,
              time,
              guests,
              note,
              status
            )
          ''')
          .eq('email', restaurantEmail!)
          .single();

      restaurantData.value = response;
      reservations.value = List<Map<String, dynamic>>.from(
          response['reservation'] ?? []
      );

      Get.snackbar(
        'Success',
        'Reservations fetched successfully',
        backgroundColor: Colors.green.shade300,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch(e) {
      Get.snackbar(
        'Error',
        '$e',
        backgroundColor: Colors.red.shade300,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> updateReservationStatus(String reservationId, String newStatus) async {
    final supabase = Supabase.instance.client;

    try {
      isLoading.value = true;


      final response = await supabase
          .from('reservation')
          .update({'status': newStatus})
          .eq('id', reservationId)
          .select();

      final index = reservations.value.indexWhere((r) => r['id'] == reservationId);
      if (index != -1) {
        reservations[index]['status'] = newStatus;
        reservations.refresh(); // Notify listeners
      }

      Get.snackbar(
        'Success',
        'Reservation ${newStatus.toLowerCase()} successfully',
        backgroundColor: newStatus == 'accepted' ? Colors.green.shade300 : Colors.orange.shade300,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update status: $e',
        backgroundColor: Colors.red.shade300,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
