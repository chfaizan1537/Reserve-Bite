import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

import '../../controllers/resturants_controller/fetch_reservation_controller.dart';
import '../../widgets/resturant/resturant_cards.dart';

class ReservationHomeView extends StatefulWidget {
  @override
  _ReservationHomeViewState createState() => _ReservationHomeViewState();
}

class _ReservationHomeViewState extends State<ReservationHomeView> {
  final FetchReservationController controller = Get.put(
      FetchReservationController());

  @override
  void initState() {
    super.initState();
    controller.fetchreservations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.fetchreservations();
        },
        backgroundColor: Color(0xFF5C3A21),
        icon: Icon(Icons.refresh, color: Colors.white),
        label: Text(
          'Refresh',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Obx(() =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  controller.isLoading.value
                      ? Container(
                    width: 150,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )
                      : Text(
                    controller.restaurantName,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                ],
              )),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              onPressed: () async {
                await Supabase.instance.client.auth.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout, color: Color(0xFFEF4444), size: 20),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.all(10),
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.blue,
backgroundColor: Colors.blue.shade50,
                ),
                SizedBox(height: 16),
                Text(
                  'Loading your dashboard...',
                  style: GoogleFonts.inter(
                    color: Color(0xFF6B7280),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Header Section
                  buildHeader(),
                  SizedBox(height: 24),

                  // Stats Cards
                  buildStatsCards(),
                  SizedBox(height: 28),

                  // tody schdul txt
                  buildTodaySchedule(),
                  SizedBox(height: 24),

                  //  reservation text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Reservations',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),

                ]),
              ),
            ),

            // Reservations List
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: controller.reservations.isEmpty
                  ? SliverFillRemaining(
                child: buildEmptyState(),
              )
                  : SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final reservation = controller.reservations[index];
                    return buildReservationCard(reservation);
                  },
                  childCount: controller.reservations.length,
                ),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 80)),
          ],
        );
      }),
    );
  }
}


