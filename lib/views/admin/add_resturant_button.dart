import 'dart:ui' as BorderType;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/custom_elevated_button.dart';
import '../../Widgets/custom_text.dart';
import '../../Widgets/custom_textfield.dart';
import '../../controllers/admin_controller/add_resturant_controller.dart';

class AddResturantButton extends StatefulWidget {
  const AddResturantButton({super.key});

  @override
  State<AddResturantButton> createState() => _AddResturantButtonState();
}

class _AddResturantButtonState extends State<AddResturantButton> {
  final Color darkBrown = const Color(0xFF5C3A21);
  final Color mediumBrown = const Color(0xFF8B5A2B);
  final Color lightBrown = const Color(0xFFD9B382);
  final Color cream = const Color(0xFFF5E6D3);
  final Color offWhite = const Color(0xFFFDFAF5);
  final AddRestaurantController controll = Get.put(AddRestaurantController());

  @override
  Widget build(BuildContext context) {

    return CircleAvatar(
      radius: 25,
      backgroundColor: const Color(0xFF5C3A21),
      child: IconButton(
        onPressed: _showAddRestaurantDialog,
        icon: const Icon(Icons.add, size: 35, color: Colors.white),
      ),
    );
  }

  void _showAddRestaurantDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          backgroundColor: Colors.transparent,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Color(0xFF5C3A21),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1.5,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                 
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: cream,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.restaurant_menu,
                              color: mediumBrown,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Add New Restaurant',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

               
                      Row(
                        children: [
                          Expanded(
                            child: _buildInputField(
                              controller: controll.name,
                              label: 'Name',
                              icon: Icons.store,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildInputField(
                              controller: controll.email,
                              label: 'Email',
                              icon: Icons.email,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                     
                      _buildInputField(
                        controller: controll.address,
                        label: 'Address',
                        icon: Icons.location_on,
                      ),
                      const SizedBox(height: 20),

         
                      _buildInputField(
                        controller: controll.category,
                        label: 'Cuisine Type',
                        icon: Icons.category,
                      ),
                      const SizedBox(height: 20),

            
                      _buildInputField(
                        controller: controll.description,
                        label: 'Description',
                        icon: Icons.description,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 20),

              
                      _buildTimePickerCard(
                        label: 'Opening Time',
                        time: controll.openingTime.value,
                        onTap: () => controll.pickOpeningTime(context),
                      ),
                      SizedBox(height: 10,),
                      _buildTimePickerCard(
                        label: 'Closing Time',
                        time: controll.closingTime.value,
                        onTap: () => controll.pickClosingTime(context),
                      ),
                      const SizedBox(height: 24),

                      Obx(
                            () => GestureDetector(
                          onTap: controll.pickRestaurantImage,
                          child: DottedBorder(
                           options: RectDottedBorderOptions(
                             color: Colors.white.withOpacity(0.5),
                             dashPattern: const [8, 4],
                             strokeWidth: 2,
                           ),
                            child: Container(
                              height: 180,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.05),
                              ),
                              child: controll.pickedImage.value != null
                                  ? ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  controll.pickedImage.value!,
                                  fit: BoxFit.cover,
                                ),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    size: 60,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Upload Restaurant Image',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'PNG, JPG (optional)',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: CustomElevatedButton(
                          styling: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onpressed: () {
                            controll.addRestaurantDetails();
                            Navigator.pop(context);
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient:LinearGradient(
                                colors: [
                                  mediumBrown,
                                  darkBrown
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(16),

                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                textchild: 'Add Restaurant',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        style: GoogleFonts.inter(
          fontSize: 16,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: cream,
              width: 2,
            ),
          ),
          prefixIcon: Icon(icon, color: lightBrown),
          labelText: label,
          labelStyle: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.white.withOpacity(0.7),
          ),
          floatingLabelStyle: GoogleFonts.inter(
            fontSize: 16,
            color: lightBrown,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildTimePickerCard({
    required String label,
    required TimeOfDay time,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.access_time_rounded,
                color: cream,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time.format(context),
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.white54,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
