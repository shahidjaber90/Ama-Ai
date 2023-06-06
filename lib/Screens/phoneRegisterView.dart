import 'package:ama_ai/Utils/colors.dart';
import 'package:ama_ai/Utils/text.dart';
import 'package:ama_ai/Widgets/getCodeTextField.dart';
import 'package:ama_ai/Widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneRegisterView extends StatelessWidget {
  PhoneRegisterView({
    super.key,
    required this.phoneNumber,
    required this.getCode,
  });

  TextEditingController phoneNumber;
  TextEditingController getCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 45,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              TextConstant.signIn,
              style:
                  GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w700),
            ),

            // Text Fields

            const SizedBox(
              height: 36,
            ),

            TextFieldWidget(
              labelText: TextConstant.phoneNumber,
              iconText: const Icon(Icons.phone_iphone_rounded),
              controllerField: phoneNumber,
              obscureVal: false,
              type: TextInputType.phone
            ),

            const SizedBox(
              height: 24,
            ),

            GetCodeTextField(controllerField: getCode),

            // Create Button

            const SizedBox(
              height: 32,
            ),

            // const SizedBox(
            //   height: 10,
            // ),

            Container(
              width: 300,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    TextConstant.logIn,
                    style: GoogleFonts.lato(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Hath nh lagane ka');
                    },
                    child: Container(
                      height: 80,
                      width: 60,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/aja-bhai.jpg'))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // Social Login

            // Center(
            //   child: Text(
            //     TextConstant.socialText,
            //     style:
            //         GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w400),
            //   ),
            // ),

            Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 5,
                            thickness: 1,
                            color: ColorConstant.tabBarUnselectedColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'or continue with',
                            style: TextStyle(
                                color: ColorConstant.tabBarUnselectedColor),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 5,
                            thickness: 1,
                            color: ColorConstant.tabBarUnselectedColor,
                          ),
                        ),
                      ],
                    ),
                  ),


            const SizedBox(height: 12),

            Container(
              height: 80,
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assets/facebook.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 55,
                      width: 50,
                      padding: EdgeInsets.only(top: 6),
                      child: Image.asset(
                        'assets/google.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 52,
                      width: 52,
                      child: Image.asset(
                        'assets/twitter.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        'assets/apple.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
