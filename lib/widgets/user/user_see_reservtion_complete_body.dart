import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservebite/Routes/routes_names.dart';

import '../../controllers/user_controllers/fetch_reservations.dart';
import '../../controllers/user_controllers/showreservations.dart';
import '../../controllers/user_controllers/user_login_controller.dart';
import '../../views/user/user_home_view.dart';
class UserSeeReservtionCompleteBody extends StatefulWidget {
  const UserSeeReservtionCompleteBody({super.key});

  @override
  State<UserSeeReservtionCompleteBody> createState() => _UserSeeReservtionCompleteBodyState();
}

class _UserSeeReservtionCompleteBodyState extends State<UserSeeReservtionCompleteBody> {
  final UserLoginController controller = Get.put(UserLoginController());
  final reservationController = Get.put(UserReservationsController());
  final Showreservations shorescontr=Get.put(Showreservations());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF4A2C1A).withOpacity(0.05),
            Colors.white,
          ],
        ),
      ),
      child: Obx(() {
        if (reservationController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF235347)),
            ),
          );
        }
        if (reservationController.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red.shade300,
                ),
                const SizedBox(height: 16),
                Text(
                  reservationController.errorMessage.value,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.red.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        if (reservationController.reservations.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF4A2C1A).withOpacity(0.1),
                  ),
                  child: const Icon(
                    Icons.restaurant_menu,
                    size: 80,
                    color: Color(0xFF235347),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'No Reservations Found',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF235347),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'You haven\'t made any reservations yet. Book a table at your favorite restaurant!',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RoutesNames.userhomescreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF235347),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Browse Restaurants',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: reservationController.reservations.length,
          itemBuilder: (_, index) {
            final res = reservationController.reservations[index];
            return TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 300 + (index * 100)),
              curve: Curves.easeOut,
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: child,
                  ),
                );
              },
              child: Container(
                margin:  EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // Show reservation details (optional)
                        shorescontr.showReservationDetails(context, res);
                      },
                      child: Column(
                        children: [
                          // Restaurant name header with status
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4A2C1A).withOpacity(0.05),
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    res.restaurantName.toUpperCase(),
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF4A2C1A),
                                    ),
                                  ),
                                ),
                                if (res.status != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: shorescontr.getStatusColor(res.status)
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          shorescontr.getStatusIcon(res.status),
                                          size: 16,
                                          color: shorescontr.getStatusColor(res.status),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          res.status!.toUpperCase(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: shorescontr.getStatusColor(res.status),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          // Reservation details
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                // Date & Time column
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            size: 16,
                                            color: Colors.grey.shade600,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              shorescontr.formatDate(res.date),
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 16,
                                            color: Colors.grey.shade600,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            res.time,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                // Guests count
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF4A2C1A).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.people,
                                        size: 18,
                                        color: const Color(0xFF4A2C1A),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${res.guests} ${res.guests == 1 ? 'Guest' : 'Guests'}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF4A2C1A),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Notes section (if available)
                          if (res.note != null && res.note!.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.note,
                                    size: 16,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      res.note!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.grey.shade600,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          // Action buttons
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (res.status?.toLowerCase() == 'pending')
                                  TextButton.icon(
                                    onPressed: () {
                                      // Cancel reservation
                                      shorescontr.showCancelDialog(context, res);
                                    },
                                    icon: const Icon(Icons.cancel, size: 18),
                                    label: Text(
                                      'Cancel',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.red.shade700,
                                    ),
                                  ),
                                const SizedBox(width: 12),
                                TextButton.icon(
                                  onPressed: () {
                                    // View details
                                    shorescontr.showReservationDetails(context, res);
                                  },
                                  icon: const Icon(Icons.info_outline, size: 18),
                                  label: Text(
                                    'Details',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    foregroundColor: const Color(0xFF4A2C1A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
