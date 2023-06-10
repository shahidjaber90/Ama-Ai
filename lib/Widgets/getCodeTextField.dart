import 'package:amaai/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetCodeTextField extends StatelessWidget {
  GetCodeTextField({super.key, required this.controllerField});

  TextEditingController controllerField;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: ColorConstant.tabBarUnselectedColor,
                offset: const Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: ColorConstant.whiteColor,
                offset: const Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ]),
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: controllerField,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16, bottom: 16),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: InputBorder.none,
                label: Text(
                  'Enter code',
                  style: GoogleFonts.lato(
                      color: ColorConstant.tabBarUnselectedColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  print('Bhai Code de de');
                },
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                      color: ColorConstant.tabBarUnselectedColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      'GET CODE',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          color: ColorConstant.greyColor),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
