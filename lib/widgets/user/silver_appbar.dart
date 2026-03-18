import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../Routes/routes_names.dart';
import '../custom_icon_button.dart';
import 'package:get/get.dart';

import '../custom_text.dart';
class SilverAppbar extends StatelessWidget {
 final  restaurant;
  SilverAppbar({super.key,required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final Color darkBrown = const Color(0xFF5C3A21);
    final Color mediumBrown = const Color(0xFF8B5A2B);
    final Color lightBrown = const Color(0xFFD9B382);
    final Color cream = const Color(0xFFF5E6D3);
    final Color offWhite = const Color(0xFFFDFAF5);
    return SliverAppBar(
      expandedHeight: 380,
      pinned: true,
      floating: false,
      backgroundColor: darkBrown,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12, top: 8),
        child: CustomIconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 28,
          ),
          onpressed: () {
            Get.offNamed(RoutesNames.userhomescreen);
          },
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Restaurant image with dark gradient overlay
            Image.network(
              restaurant['image_url'],
              fit: BoxFit.cover,
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    darkBrown.withOpacity(0.7),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 24,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textchild: restaurant['name'].toString().toUpperCase(),
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 6),
                    decoration: BoxDecoration(
                      color: mediumBrown,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: CustomText(
                      textchild: restaurant['category'],
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
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
