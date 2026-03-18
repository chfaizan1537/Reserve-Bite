import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Routes/routes_names.dart';
import '../custom_elevated_button.dart';
import '../custom_text.dart';
import 'info_card.dart';
import 'package:get/get.dart';
class UserCustomBody extends StatelessWidget {
  final restaurant;
  UserCustomBody({super.key,required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final Color darkBrown = const Color(0xFF5C3A21);
    final Color mediumBrown = const Color(0xFF8B5A2B);
    final Color lightBrown = const Color(0xFFD9B382);
    final Color cream = const Color(0xFFF5E6D3);
    final Color offWhite = const Color(0xFFFDFAF5);
    return  SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: 20),

          // Address card
          InfoCard(
            icon: Icons.location_on,
            title: 'Location',
            content: restaurant['address'],
          ),

          const SizedBox(height: 16),

          InfoCard(
            icon: Icons.access_time,
            title: 'Opening Hours',
            content:
            '${restaurant['opening_time']} PM - ${restaurant['closing_time']} PM',
          ),

          const SizedBox(height: 16),

          // aboutt section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textchild: 'About',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CustomText(
                    textchild: restaurant['description'],
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: CustomElevatedButton(
                styling: ElevatedButton.styleFrom(
                  backgroundColor: mediumBrown,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                  shadowColor: mediumBrown.withOpacity(0.4),
                ),
                onpressed: () {
                  Get.toNamed(
                    RoutesNames.userbooktable,
                    arguments: restaurant,
                  );
                },
                child: Text(
                  'Book a Table',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
