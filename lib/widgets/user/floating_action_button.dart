import 'package:flutter/material.dart';

import '../../controllers/user_controllers/fetch_reservations.dart';
import 'package:get/get.dart';

class UserFloatingActionButton extends StatelessWidget {
  final reservationController = Get.put(UserReservationsController());
   UserFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: ()async{
    await  reservationController.refreshReservations();
    }, icon: Icon(Icons.refresh));
  }
}
