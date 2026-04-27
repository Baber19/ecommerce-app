import 'dart:async';

import 'package:ecommercer_app/app_constants.dart';
import 'package:ecommercer_app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),()async{
      String nextPage = AppRoutes.Login_Route;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(AppConstants.USER_TOKEN) ?? "";

      if(token.isNotEmpty){
        nextPage= AppRoutes.Dashboard_Route;
      }

      Navigator.pushReplacementNamed(context, AppRoutes.Dashboard_Route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined,size: 40),
            Text("Ecommerce App")
          ],
        ),
      ),
    );
  }
}
