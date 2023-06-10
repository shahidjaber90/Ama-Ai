import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? accessToken;
  Future<String> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('getaccesToken') ?? '';
    print("Chutiyapa>>>>>>>: $accessToken");
    return accessToken;
  }

  Future<void> logoutFunction(String tokens) async {
    final url = Uri.parse(
        'http://buddee-dev-load-balancer-2023149093.us-west-1.elb.amazonaws.com/public/api/mobile/v1/logout');

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer  $tokens',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      // Request successful, handle the response here
      print('API response: ${response.body}');
    } else {
      // Request failed, handle the error
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP BAR "),
        actions: [
          IconButton(
              onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                await logoutFunction(prefs.getString('getaccesToken').toString()).then((value) =>  prefs.remove('getaccesToken'));
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              getAccessToken();
              print(
                  "chutiyapa Token>>>>>> : ${prefs.getString('getaccesToken')}");
            },
            child: Text('Token')),
      ),
    );
  }
}
