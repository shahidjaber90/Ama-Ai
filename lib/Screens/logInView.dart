import 'dart:convert';
import 'package:amaai/Screens/dashboard.dart';
import 'package:amaai/Utils/list.dart';
import 'package:http/http.dart' as http;
import 'package:amaai/Screens/registerEmail.dart';
import 'package:amaai/Utils/text.dart';
import 'package:amaai/Widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInView extends StatefulWidget {
  LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  String? accessToken;
  Future<void> saveAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
  }


  Future<void> sendAPIRequest() async {
    final url = Uri.parse(
        'http://buddee-dev-load-balancer-2023149093.us-west-1.elb.amazonaws.com/public/api/mobile/v1/login');

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'email': emailController.text,
      'password': passwordController.text,
    });

    final response = await http.post(url, headers: headers, body: body);
    var responseData = jsonDecode(response.body);

    // Access the access token
    var accessToken = responseData['data']['accessToken'];
    // accessToken.

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('getaccesToken', accessToken);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));

      print('Access Token >>>>>>>>: $accessToken');
      print('API response: ${response.body}');
      print('This is save access token: $accessToken');
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 1.00,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                Text(
                  TextConstant.hello,
                  style: GoogleFonts.lato(
                      fontSize: 30, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  TextConstant.account,
                  style: GoogleFonts.lato(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),

                // Text Fields

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),

                TextFieldWidget(
                    labelText: TextConstant.emailText,
                    iconText: const Icon(Icons.email),
                    controllerField: emailController,
                    obscureVal: false,
                    type: TextInputType.emailAddress),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                TextFieldWidget(
                    labelText: TextConstant.password,
                    iconText: const Icon(Icons.lock),
                    controllerField: passwordController,
                    obscureVal: true,
                    type: TextInputType.emailAddress),

                // Create Button

                const SizedBox(
                  height: 24,
                ),

                Container(
                  width: 300,
                  height: 40,
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
                          sendAPIRequest();

                          emailController.clear();
                          passwordController.clear();
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                // Social Login

                Center(
                  child: Text(
                    TextConstant.socialText,
                    style: GoogleFonts.lato(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),

                Container(
                  height: 70,
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

                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.lato(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPageView()));
                          },
                          child: Text(
                            'Register',
                            style: GoogleFonts.lato(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
