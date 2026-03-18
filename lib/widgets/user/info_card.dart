import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom_text.dart';
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  InfoCard({super.key,required this.title,required this.icon,required this.content});

  @override
  Widget build(BuildContext context) {
    final Color darkBrown = const Color(0xFF5C3A21);
    final Color mediumBrown = const Color(0xFF8B5A2B);
    final Color lightBrown = const Color(0xFFD9B382);
    final Color cream = const Color(0xFFF5E6D3);
    final Color offWhite = const Color(0xFFFDFAF5);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon with background
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: lightBrown.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: mediumBrown,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textchild: title,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    textchild: content,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

