import 'package:flutter/material.dart';
import 'package:wails_music_player/core/theme/app_pallette.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback ontap;
  const AuthGradientButton(
      {super.key, required this.buttonLabel, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              colors: [Pallete.gradient1, Pallete.gradient2],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(395, 55),
              backgroundColor: Pallete.transparentColor,
              shadowColor: Pallete.transparentColor),
          child: Text(
            buttonLabel,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          )),
    );
  }
}
