import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/user_controllers/book_table_controller.dart';
import 'package:get/get.dart';
class BookTableSelectTime extends StatefulWidget {
  const BookTableSelectTime({super.key});

  @override
  State<BookTableSelectTime> createState() => _BookTableSelectTimeState();
}

class _BookTableSelectTimeState extends State<BookTableSelectTime> {
  final BookingController controller = Get.put(BookingController());
  final Color darkBrown = const Color(0xFF5C3A21);
  final Color mediumBrown = const Color(0xFF8B5A2B);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              'Select Time',
              style: GoogleFonts.playfairDisplay(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: darkBrown,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        //tim selecton
        Obx(() {
          // Read the observable HERE so GetX tracks it
          final currentSelectedTime = controller.selectedTime.value;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
            ),
            itemCount: controller.timeSlots.length,
            padding: EdgeInsetsGeometry.all(10),
            itemBuilder: (context, index) {
              final time = controller.timeSlots[index];
              final isSelected =
                  currentSelectedTime == time; // use captured value

              return GestureDetector(
                onTap: () => controller.updateTime(time),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? mediumBrown : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? darkBrown : mediumBrown,
                    ),
                  ),

                  child: Center(
                    child: Text(
                      time,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        })
      ],
    );
  }
}
