import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservebite/Routes/routes_names.dart';
import 'package:reservebite/Widgets/custom_elevated_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../Widgets/custom_container.dart';
import '../../Widgets/custom_text.dart';
import 'package:get/get.dart';
class ResturantsDisplayCard extends StatefulWidget {
  const ResturantsDisplayCard({super.key});

  @override
  State<ResturantsDisplayCard> createState() => _ResturantsDisplayCardState();
}

class _ResturantsDisplayCardState extends State<ResturantsDisplayCard> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client
          .from('resturants')
          .stream(primaryKey: ['id']),
      builder: (context, snapshot) {
        var aldata = snapshot.data ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: aldata.length,
            itemBuilder: (context, index) {
              final current = aldata[index];
              return Padding(
                padding: EdgeInsetsGeometry.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 10,
                ),
                child: CustomContainer(
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(0, 6),
                        blurRadius: 16,
                        spreadRadius: 3,
                      ),
                    ],
                  ),

                  height: 350,
                  child: Column(
                    children: [
                      CustomContainer(
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(15),
                          child: Image.network(
                            '${current['image_url']}',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.drive_file_rename_outline,color: Color(0xFF4A2C1A),),
                          SizedBox(width: 10),
                          CustomText(
                            textchild: '${current['name']}',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.location_on,color: Color(0xFF4A2C1A),),
                          SizedBox(width: 10),

                          Expanded(
                            child: CustomText(
                              // alingment: TextAlign.center,
                              textchild: '${current['address']}',
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                color: Colors
                                    .grey
                                    .shade700, // fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: CustomElevatedButton(styling: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4A2C1A),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10)
                          )
                        ),
                            onpressed: (){
                          Get.toNamed(RoutesNames.resturantdetail,arguments: aldata[index]);
                          },
                            child: CustomText(textchild: 'View Details',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 20
                                ))),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
