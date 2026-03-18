import 'package:flutter/material.dart';
class CustomIconButton extends StatelessWidget {
 final Widget icon;
 final ButtonStyle? style;
 final Function() onpressed;
   CustomIconButton({super.key,required this.icon,required this.onpressed,this.style});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: style,
        onPressed: onpressed, icon: icon);
  }
}
