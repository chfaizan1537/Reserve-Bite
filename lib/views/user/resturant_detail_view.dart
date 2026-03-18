import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservebite/Widgets/custom_elevated_button.dart';
import 'package:reservebite/Widgets/custom_icon_button.dart';
import 'package:reservebite/Widgets/custom_text.dart';
import 'package:reservebite/routes/routes_names.dart';
import 'package:reservebite/widgets/custom_icon.dart';
import 'package:reservebite/widgets/user/custom_body_list.dart';
import 'package:reservebite/widgets/user/silver_appbar.dart';

import '../../widgets/user/info_card.dart';

class ResturantDetailView extends StatefulWidget {
  const ResturantDetailView({super.key});

  @override
  State<ResturantDetailView> createState() => _ResturantDetailViewState();
}

class _ResturantDetailViewState extends State<ResturantDetailView> {
  final restaurant = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFAF5),
      body: CustomScrollView(
        slivers: [


SilverAppbar(restaurant: restaurant),

         UserCustomBody(restaurant: restaurant)
        ],
      ),
    );
  }

}