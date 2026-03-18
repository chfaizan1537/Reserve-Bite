import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../controllers/resturants_controller/fetch_reservation_controller.dart';
import 'package:get/get.dart';

import '../../views/resturants/reservation_detail_view.dart';
final FetchReservationController controller = Get.put(FetchReservationController());

Widget buildHeader() {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFFD9B382),
          Color(0xFF8B5A2B),
          Color(0xFF5C3A21)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Color(0xFF2A2E45).withOpacity(0.3),
          blurRadius: 20,
          offset: Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.restaurant_menu,
                color: Colors.white,
                size: 24,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reservation Dashboard',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    controller.restaurantName,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            buildHeaderStat(
              'Address',
              controller.restaurantData.value['address'],
              Icons.location_on,
            ),
            SizedBox(width: 20),
            buildHeaderStat(
              'Category',
              '${controller.restaurantData.value['category']} ',
              Icons.category,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildHeaderStat(String label, String value, IconData icon) {
  return Expanded(
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.white.withOpacity(0.8),
          size: 18,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildStatsCards() {

  int pendingCount = controller.reservations.where((r) =>
  r['status'] == 'pending' || r['status'] == null
  ).length;

  return Row(
    children: [
      Expanded(
        child: buildStatCard(
          title: 'Total Reservations',
          value: '${controller.reservations.length}',
          icon: Icons.calendar_today,
          color: Color(0xFF235347),
          gradient: [
            Color(0xFFD9B382),
            Color(0xFFD9B382),

          ],
        ),
      ),
      SizedBox(width: 16),
      Expanded(
        child: buildStatCard(
          title: 'Pending',
          value: '$pendingCount',
          icon: Icons.filter_alt_outlined,
          color:  Color(0xFFD9B382),
          gradient: [
            Color(0xFFD9B382),
            Color(0xFFD9B382),],
        ),
      ),
    ],
  );
}

Widget buildStatCard({
  required String title,
  required String value,
  required IconData icon,
  required Color color,
  required List<Color> gradient,
}) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: gradient,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.3),
          blurRadius: 15,
          offset: Offset(0, 5),
        ),
      ],
    ),
    height: 180,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
        SizedBox(height: 16),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget buildTodaySchedule() {
  // Get today's date
  final today = DateTime.now();
  final todayReservations = controller.reservations.where((r) {
    if (r['date'] == null) return false;
    try {
      final date = DateTime.parse(r['date'].toString());
      return date.year == today.year &&
          date.month == today.month &&
          date.day == today.day;
    } catch (e) {
      return false;
    }
  }).toList();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Today's Schedule",
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1F2937),
        ),
      ),
      SizedBox(height: 16),
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: todayReservations.isEmpty
            ? Center(
          child: Column(
            children: [
              Icon(
                Icons.event_busy,
                size: 40,
                color: Color(0xFF9CA3AF),
              ),
              SizedBox(height: 12),
              Text(
                'No reservations for today',
                style: GoogleFonts.inter(
                  color: Color(0xFF6B7280),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
            : Column(
          children: todayReservations.take(3).map((r) {
            return buildScheduleItem(r);
          }).toList(),
        ),
      ),
    ],
  );
}

Widget buildScheduleItem(dynamic reservation) {
  String timeString = '';
  if (reservation['date'] != null) {
    try {
      final date = DateTime.parse(reservation['date'].toString());
      timeString = DateFormat('hh:mm a').format(date);
    } catch (e) {
      timeString = 'Time not set';
    }
  }

  return Container(
    margin: EdgeInsets.only(bottom: 12),
    padding: EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            timeString,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B5563),
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reservation['customer_name'] ?? 'Guest',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF1F2937),
                ),
              ),
              Text(
                '${reservation['guests'] ?? 0} guests',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: getStatusColor(reservation['status']).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            reservation['status'] ?? 'Pending',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: getStatusColor(reservation['status']),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildReservationCard(dynamic reservation) {
  return GestureDetector(
    onTap: () {
      Get.to(
            () => ReservationDetailView(
          reservation: reservation,
          onStatusChanged: () {
            // Refresh the list when status changes
            controller.fetchreservations();
          },
        ),
        transition: Transition.rightToLeft,
        duration: Duration(milliseconds: 300),
      );
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF8B5A2B),
                  Color(0xFF5C3A21),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                reservation['guests']?.toString() ?? '0',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reservation['time'] ,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.people_outline,
                      size: 14,
                      color: Color(0xFF6B7280),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${reservation['guests'] ?? 0} guests',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: Color(0xFF6B7280),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        formatDate(reservation['date']),
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ],
                ),
                if (reservation['status'] != null)
                  SizedBox(height: 8),
                if (reservation['status'] != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: getStatusColor(reservation['status']).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      reservation['status'],
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: getStatusColor(reservation['status']),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Color(0xFF4B5563),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildEmptyState() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Color(0xFFF3F4F6),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.event_note,
            size: 48,
            color: Color(0xFF9CA3AF),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'No reservations yet',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'When you receive reservations,\nthey will appear here',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Color(0xFF6B7280),
            height: 1.5,
          ),
        ),
      ],
    ),
  );
}

Color getStatusColor(String? status) {
  switch (status?.toLowerCase()) {
    case 'accepted':
      return Color(0xFF10B981);
    case 'pending':
      return Color(0xFFF59E0B);
    case 'rejected':
      return Color(0xFFEF4444);
    default:
      return Color(0xFFF59E0B);
  }
}

String formatDate(dynamic date) {
  if (date == null) return 'No date';
  try {
    final parsedDate = DateTime.parse(date.toString());
    return DateFormat('MMM dd, yyyy').format(parsedDate);
  } catch (e) {
    return 'Invalid date';
  }
}
