import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/user_controllers/book_table_controller.dart';
class UserBookTableSpecialRequest extends StatefulWidget {
  const UserBookTableSpecialRequest({super.key});

  @override
  State<UserBookTableSpecialRequest> createState() => _UserBookTableSpecialRequestState();
}

class _UserBookTableSpecialRequestState extends State<UserBookTableSpecialRequest> {
  final BookingController controller = Get.put(BookingController());
  final Color darkBrown = const Color(0xFF5C3A21);
  final Color cream = const Color(0xFFF5E6D3);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 15),
            Text(
              'Special Requests (Optional)',
              style: GoogleFonts.playfairDisplay(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: darkBrown,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),
        //special req field
        Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: Card(
            elevation: 5,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.text,
              controller: controller.specialRequestsController,
              maxLines: 4,

              decoration: InputDecoration(
                hintText:
                "Dietery restriction , seating preferences , etc ",
                hintStyle: GoogleFonts.playfairDisplay(
                  color: Colors.grey.shade700,
                  fontSize: 20,
                ),
                prefixIcon: Container(
                  decoration: BoxDecoration(
                    color: cream,
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),
                  padding: EdgeInsetsGeometry.all(10),
                  margin: EdgeInsetsGeometry.all(10),
                  child: Icon(
                    Icons.description_outlined,
                    size: 30,
                    color: darkBrown,
                  ),
                ),
                fillColor: Colors.white,

                filled: true,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFB8860B)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
