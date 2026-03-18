import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../controllers/resturants_controller/fetch_reservation_controller.dart';

class ReservationDetailView extends StatelessWidget {
  final Map<String, dynamic> reservation;
  final VoidCallback onStatusChanged;

  const ReservationDetailView({
    Key? key,
    required this.reservation,
    required this.onStatusChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FetchReservationController>();

    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8),
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
            child: Icon(Icons.arrow_back, color: Color(0xFF2A2E45), size: 20),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Reservation Details',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeaderCard(),
            SizedBox(height: 20),
            _buildInfoCard(),
            SizedBox(height: 20),
            _buildNotesCard(),
            SizedBox(height: 30),
            _buildActionButtons(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: EdgeInsets.all(24),
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
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.restaurant,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reservation['resturant_name'] ?? 'Restaurant Name',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Reservation ID: ${reservation['id']?.toString().substring(0, 8)}...',
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
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: _getStatusColor(reservation['status']).withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: _getStatusColor(reservation['status']).withOpacity(0.5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getStatusIcon(reservation['status']),
                  color: _getStatusColor(reservation['status']),
                  size: 16,
                ),
                SizedBox(width: 8),
                Text(
                  reservation['status']?.toString().toUpperCase() ?? 'PENDING',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _getStatusColor(reservation['status']),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reservation Information',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 16),
          _buildInfoRow(
            icon: Icons.person_outline,
            label: 'Customer',
            value: reservation['customer_name'] ?? 'Guest',
          ),
          _buildInfoRow(
            icon: Icons.people_outline,
            label: 'Guests',
            value: '${reservation['guests'] ?? 0} people',
          ),
          _buildInfoRow(
            icon: Icons.calendar_today_outlined,
            label: 'Date',
            value: _formatDate(reservation['date']),
          ),
          _buildInfoRow(
            icon: Icons.access_time,
            label: 'Time',
            value: _formatTime(reservation['date']),
          ),
          if (reservation['table_number'] != null)
            _buildInfoRow(
              icon: Icons.event_seat,
              label: 'Table',
              value: 'Table ${reservation['table_number']}',
            ),
        ],
      ),
    );
  }

  Widget _buildNotesCard() {
    if (reservation['note'] == null || reservation['note'].toString().isEmpty) {
      return SizedBox.shrink();
    }

    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.note_outlined, size: 20, color: Color(0xFF6B7280)),
              SizedBox(width: 8),
              Text(
                'Special Notes',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2937),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            reservation['note'],
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Color(0xFF4B5563),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({required IconData icon, required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: Color(0xFF4B5563)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(FetchReservationController controller) {
    final currentStatus = reservation['status']?.toString().toLowerCase();

    if (currentStatus == 'accepted' || currentStatus == 'rejected') {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Icon(
              currentStatus == 'accepted' ? Icons.check_circle : Icons.cancel,
              color: currentStatus == 'accepted' ? Colors.green : Colors.red,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'This reservation has been ${currentStatus}',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Color(0xFF4B5563),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              await controller.updateReservationStatus(reservation['id'], 'accepted');
              onStatusChanged();
              Navigator.pop;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF10B981),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, size: 20),
                SizedBox(width: 8),
                Text(
                  'Accept',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: () async {
              await controller.updateReservationStatus(reservation['id'], 'rejected');
              onStatusChanged();
              Navigator.pop;
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Color(0xFFEF4444),
              side: BorderSide(color: Color(0xFFEF4444).withOpacity(0.5)),
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cancel_outlined, size: 20),
                SizedBox(width: 8),
                Text(
                  'Reject',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String? status) {
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

  IconData _getStatusIcon(String? status) {
    switch (status?.toLowerCase()) {
      case 'accepted':
        return Icons.check_circle;
      case 'pending':
        return Icons.hourglass_empty;
      case 'rejected':
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  String _formatDate(dynamic date) {
    if (date == null) return 'No date';
    try {
      final parsedDate = DateTime.parse(date.toString());
      return DateFormat('EEEE, MMMM d, yyyy').format(parsedDate);
    } catch (e) {
      return 'Invalid date';
    }
  }

  String _formatTime(dynamic date) {
    if (date == null) return 'No time';
    try {
      final parsedDate = DateTime.parse(date.toString());
      return DateFormat('h:mm a').format(parsedDate);
    } catch (e) {
      return 'Invalid time';
    }
  }


}



