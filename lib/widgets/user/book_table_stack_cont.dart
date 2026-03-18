import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom_container.dart';
import '../custom_icon_button.dart';
import '../custom_text.dart';
class BookTableStackCont extends StatelessWidget {
  final current;
  const BookTableStackCont({super.key,required this.current});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomContainer(
          height: 270,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              colors: [Colors.brown.shade400, Color(0xFF4A2C1A)],
            ),
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 120),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 15),
                child: CustomText(
                  textchild: 'Book a Table ',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 15),

                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF8B5A2B),
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 15,
                    vertical: 6,
                  ),
                  child: CustomText(
                    textchild: '${current['name'].toString().toUpperCase()}',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 60,
          left: 10,
          child: Center(
            child: CustomIconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30,
              ),
              onpressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}

