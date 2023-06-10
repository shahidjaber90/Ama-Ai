import 'package:amaai/Screens/registerEmail.dart';
import 'package:amaai/Utils/text.dart';
import 'package:amaai/Widgets/button.dart';
import 'package:amaai/Widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView(
                controller: _controller,
                children: [
                  CONTAINER(
                    name: "assets/4.json",
                    text: TextConstant.one,
                  ),
                  CONTAINER(
                    name: "assets/2.json",
                    text: TextConstant.two,
                  ),
                  CONTAINER(
                    name: "assets/3.json",
                    text: TextConstant.three,
                  ),
                  CONTAINER(
                    name: "assets/4.json",
                    text: TextConstant.four,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: SlideEffect(
                      spacing: 8.0,
                      radius: 20.0,
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.grey.shade400,
                      activeDotColor: Colors.blue.shade400),
                ),
                const SizedBox(
                  height: 14,
                ),
                MainButton(
                    text: "Get Started",
                    ontap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPageView()));
                    }),
                // const SizedBox(
                //   height: 12,
                // ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPageView()));
                  },
                  child: Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[400],
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
