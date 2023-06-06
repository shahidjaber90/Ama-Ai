import 'package:ama_ai/Screens/phoneRegisterView.dart';
import 'package:ama_ai/Screens/registerEmail.dart';
import 'package:ama_ai/Utils/colors.dart';
import 'package:ama_ai/Utils/text.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ContainedTabBarView(
              tabBarProperties: TabBarProperties(
                width: 120,
                labelColor: ColorConstant.tabBarColor,
                unselectedLabelColor: ColorConstant.tabBarUnselectedColor,
              ),
              tabs: [
                Text(
                  TextConstant.emailText,
                  style:
                      GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w900),
                ),
                Text(
                  TextConstant.phoneTitle,
                  style:
                      GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w900),
                ),
              ],
              views: [
                RegisterEmailView(
                    userName: userNameController,
                    email: emailController,
                    password: passwordController,
                    confirmPassword: confirmPasswordController),
                PhoneRegisterView(
                    phoneNumber: phoneNumberController,
                    getCode: passwordController)
              ],
              onChange: (index) => print(index),
            ),
          ),
        ),
      ),
    );
  }
}
