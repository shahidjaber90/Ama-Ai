import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CONTAINER extends StatelessWidget {
  const CONTAINER({super.key, required this.name, required this.text});

  final String name;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 280,
              child: LottieBuilder.asset(
                name,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
