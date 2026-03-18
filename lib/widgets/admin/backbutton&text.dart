import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Routes/routes_names.dart';
import '../custom_icon.dart';
import '../custom_text.dart';
class Backbuttontext extends StatefulWidget {
  const Backbuttontext({super.key});

  @override
  State<Backbuttontext> createState() => _BackbuttontextState();
}

class _BackbuttontextState extends State<Backbuttontext> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(onPressed: (){
        Get.toNamed(RoutesNames.rolescreen);
      }, icon: CustomIcon(color: Colors.white,
          icon: Icons.arrow_back_ios,
          size: 30)),
      CustomText(textchild: 'Back to Role Screen',
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 25,
            // fontWeight: FontWeight.bold
          ))
    ],);
  }
}
