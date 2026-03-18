import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
 final String textchild;
 final TextStyle style;
 final TextAlign? alingment;

  CustomText({super.key,required this.textchild,required this.style,this.alingment});

  @override
  Widget build(BuildContext context) {
    return Text(textAlign: alingment,
     textchild,style:style,);
  }
}
