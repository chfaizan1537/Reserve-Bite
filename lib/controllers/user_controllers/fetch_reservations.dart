import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../model/reservation_model.dart';

class UserReservationsController extends GetxController {
  final RxList<Reservation> reservations = <Reservation>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  final supabase = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
    fetchUserReservations();
  }

  Future<void> fetchUserReservations() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      errorMessage.value = 'User not authenticated.';
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      debugPrint('Fetching reservations for user: ${user.id}');

      final response = await supabase
          .from('reservation') //
          .select()
          .eq('user_id', user.id)
          .order('date', ascending: true);

      debugPrint('Raw response: $response');

      if (response is List) {
        final List<Reservation> fetched = response
            .map((item) {
          debugPrint('Mapping item: $item');
          return Reservation.fromMap(item);
        })
            .toList();
        reservations.assignAll(fetched);
        debugPrint('Fetched ${fetched.length} reservations');
      } else {

      }
    } catch (e, stack) {
      debugPrint('Exception caught: $e');
      debugPrint('Stack trace: $stack');
      errorMessage.value = 'Failed to load reservations: $e';
      Get.snackbar(
        'Error',
        '$e',
        backgroundColor: Colors.red.shade300,
        colorText: Colors.white,
        borderRadius: 15,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshReservations() => fetchUserReservations();
}