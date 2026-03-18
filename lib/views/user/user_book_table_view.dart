import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservebite/Routes/routes_names.dart';
import 'package:reservebite/Widgets/custom_container.dart';
import 'package:reservebite/Widgets/custom_icon_button.dart';
import 'package:reservebite/Widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:reservebite/widgets/user/book_table_guests.dart';
import 'package:reservebite/widgets/user/book_table_select_date.dart';
import 'package:reservebite/widgets/user/book_table_select_time.dart';
import 'package:reservebite/widgets/user/book_table_stack_cont.dart';
import 'package:reservebite/widgets/user/book_table_summar_btn.dart';
import 'package:reservebite/widgets/user/user_book_table_special_request_portion.dart';

import '../../controllers/user_controllers/book_table_controller.dart';

class UserBookTableView extends StatefulWidget {
  const UserBookTableView({super.key});

  @override
  State<UserBookTableView> createState() => _UserBookTableViewState();
}

class _UserBookTableViewState extends State<UserBookTableView> {
  final BookingController controller = Get.put(BookingController());
  final current = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final Color darkBrown = const Color(0xFF5C3A21);
    final Color mediumBrown = const Color(0xFF8B5A2B);
    final Color lightBrown = const Color(0xFFD9B382);
    final Color cream = const Color(0xFFF5E6D3);
    final Color offWhite = const Color(0xFFFDFAF5);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //top contain
            BookTableStackCont(current: current),
            SizedBox(height: 20),
            // select date portion
            BookTableSelectDate(),
           SizedBox(height: 24),
            //slct time porton

            BookTableSelectTime(),
             SizedBox(height: 24),

            // guest portion
            BookTableGuests(),

            SizedBox(height: 24),

            // special req portion
            UserBookTableSpecialRequest(),
            // summary cont & book btn
            BookTableSummarBtn(current: current)
          ],
        ),
      ),
    );
  }

}
