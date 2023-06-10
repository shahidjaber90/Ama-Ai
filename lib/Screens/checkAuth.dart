import 'package:amaai/Controller/googleSignInController.dart';
import 'package:amaai/Utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class CheckAuth extends StatelessWidget {
  CheckAuth({super.key});

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  authService.signInGoogle();
                  print('email : >>> ${authService.userEmail.toString()}');
                  print('name : >>> ${authService.userName.toString()}');
                },
                child: Text('Check Authentication')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Log out',
                        style: TextStyle(color: ColorConstant.tabBarColor),
                      ),
                      content: Text(
                        'Do you wanna Sign out?',
                        style: TextStyle(color: ColorConstant.tabBarColor),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              FirebaseAuth _auth = FirebaseAuth.instance;
                              await _auth
                                  .signOut()
                                  .then((value) => Navigator.pop(context));
                            },
                            child: Text('OK'))
                      ],
                    );
                  },
                );
                // Sign-out successful
                print('Sign Out Successfully');
              },
              child: Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
