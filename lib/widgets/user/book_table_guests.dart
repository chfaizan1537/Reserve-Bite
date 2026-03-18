import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/user_controllers/book_table_controller.dart';
class BookTableGuests extends StatefulWidget {
  const BookTableGuests({super.key});

  @override
  State<BookTableGuests> createState() => _BookTableGuestsState();
}

class _BookTableGuestsState extends State<BookTableGuests> {
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
              'Number Of Guests',
              style: GoogleFonts.playfairDisplay(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: darkBrown,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        //no of gust field
        Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: TextField(
            keyboardType: TextInputType.number,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: "Enter Number Of Guests",
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
                  Icons.people_alt_outlined,
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
            onChanged: (value) {
              final int? guests = int.tryParse(value);
              if (guests != null && guests > 0) {
                controller.updateGuests(guests);
              }
            },
          ),
        ),
      ],
    );
  }
}
