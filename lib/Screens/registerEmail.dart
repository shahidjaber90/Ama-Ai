import 'package:ama_ai/Utils/text.dart';
import 'package:ama_ai/Widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterEmailView extends StatelessWidget {
  RegisterEmailView(
      {super.key,
      required this.userName,
      required this.email,
      required this.password,
      required this.confirmPassword});

  TextEditingController userName;
  TextEditingController email;
  TextEditingController password;
  TextEditingController confirmPassword;

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
              TextConstant.title,
              style:
                  GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w700),
            ),

            // Text Fields

            const SizedBox(
              height: 36,
            ),

            TextFieldWidget(
              labelText: TextConstant.userName,
              iconText: const Icon(Icons.person),
              controllerField: userName,
              obscureVal: false,
              type: TextInputType.emailAddress
            ),

            const SizedBox(
              height: 24,
            ),

            TextFieldWidget(
              labelText: TextConstant.emailText,
              iconText: const Icon(Icons.email),
              controllerField: email,
              obscureVal: false,
              type: TextInputType.emailAddress
            ),

            const SizedBox(
              height: 24,
            ),

            TextFieldWidget(
              labelText: TextConstant.password,
              iconText: const Icon(Icons.lock),
              controllerField: password,
              obscureVal: true,
              type: TextInputType.emailAddress
            ),

            const SizedBox(
              height: 24,
            ),

            TextFieldWidget(
              labelText: TextConstant.confirmPassword,
              iconText: const Icon(Icons.lock),
              controllerField: confirmPassword,
              obscureVal: true,
              type: TextInputType.emailAddress
            ),

            // Create Button

            const SizedBox(
              height: 10,
            ),

            Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'LOG IN',
                        style: GoogleFonts.lato(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ))
                ],
              ),
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
                    TextConstant.create,
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

            Center(
              child: Text(
                TextConstant.socialText,
                style:
                    GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w400),
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
