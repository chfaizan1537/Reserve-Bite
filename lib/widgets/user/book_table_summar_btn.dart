import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/user_controllers/book_table_controller.dart';
class BookTableSummarBtn extends StatefulWidget {
  final current;
  BookTableSummarBtn({super.key,required this.current});

  @override
  State<BookTableSummarBtn> createState() => _BookTableSummarBtnState();
}

class _BookTableSummarBtnState extends State<BookTableSummarBtn> {
  final BookingController controller = Get.put(BookingController());
  final Color darkBrown = const Color(0xFF5C3A21);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: EdgeInsetsGeometry.only(left: 10, right: 10),
          child: Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),

              child: Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // SizedBox(width: 5,),
                        Text(
                          'Reservation Summary',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: darkBrown,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Restaurant',
                          style: GoogleFonts.playfairDisplay(fontSize: 20),
                        ),
                        Text(
                          '${widget.current['name']}',
                          style: GoogleFonts.playfairDisplay(fontSize: 20),
                        ),
                      ],
                    ),
                    const Divider(height: 16),
                    Obx(() {
                      final date = controller.selectedDate.value;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            date != null
                                ? '${date.month}/${date.day}/${date.year}'
                                : 'Not selected',
                            style: GoogleFonts.poppins(fontSize: 17),
                          ),
                        ],
                      );
                    }),
                    const Divider(height: 16),
                    Obx(() {
                      final time = controller.selectedTime.value;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            time.isEmpty ? 'Not selected' : time,
                            style: GoogleFonts.poppins(fontSize: 17),
                          ),
                        ],
                      );
                    }),
                    const Divider(height: 16),
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Guests',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            controller.numberOfGuests.value.toString(),
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),
        // booktable button
        Obx(() {
          return Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () => controller.saveBooking(
                  context,
                  widget.current['name'],
                  widget.current['id'].toString(),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkBrown,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: controller.isLoading.value
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                    : const Text(
                  'Book Table',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }),
        SizedBox(height: 50),
      ],
    );
  }
}
