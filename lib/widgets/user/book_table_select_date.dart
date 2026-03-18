import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/user_controllers/book_table_controller.dart';
import 'package:get/get.dart';
class BookTableSelectDate extends StatefulWidget {
  const BookTableSelectDate({super.key});

  @override
  State<BookTableSelectDate> createState() => _BookTableSelectDateState();
}

class _BookTableSelectDateState extends State<BookTableSelectDate> {
  final BookingController controller = Get.put(BookingController());
  final Color darkBrown = const Color(0xFF5C3A21);
  final Color mediumBrown = const Color(0xFF8B5A2B);
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        //slct date txt
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              'Select Date',
              style: GoogleFonts.playfairDisplay(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: darkBrown,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        //select date cont
        Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: GestureDetector(
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 30)),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(primary: darkBrown),
                    ),
                    child: child!,
                  );
                },
              );
              if (picked != null) {
                controller.updateDate(picked);
              }
            },
            child: Card(
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        color: Color(0xFFF5E6D3),
                      ),
                      padding: EdgeInsetsGeometry.all(10),
                      child: Icon(
                        Icons.calendar_today,
                        size: 30,
                        color: Color(0xFF8B5A2B),
                      ),
                    ),
                    SizedBox(width: 30),
                    Obx(() {
                      final date = controller.selectedDate.value;
                      return Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'Date',
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Text(
                            date == null
                                ? 'Select Date '
                                : '${date.month}/${date.day}/${date.year}',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.grey.shade700,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(width: 70),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: darkBrown,
                      size: 26,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


