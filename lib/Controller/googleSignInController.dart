import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthService {
  String? userEmail;
  String? userName;
  signInGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    var userEmail = gUser!.email;
    var userName = gUser.displayName;
    print(userEmail);
    print(userName);

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOutGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }


}

  createuser(data) async {
  const url = "http://buddee-dev-load-balancer-2023149093.us-west-1.elb.amazonaws.com/public/api/mobile/v1/register";
  var baseurl = Uri.parse(url);
  Response response = await http.post(
    baseurl,
    body: jsonEncode(data),
    headers: {'content-type': 'application/json'},
  );
  print(response.body);
}