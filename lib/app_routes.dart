import 'package:ecommercer_app/ui/dashboard/dasboard_page.dart';
import 'package:ecommercer_app/ui/on_boarding/pages/loginpage/login_page.dart';
import 'package:ecommercer_app/ui/on_boarding/pages/signup_page/singup_page.dart';
import 'package:ecommercer_app/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static const String Splash_Route = '/';
  static const String Login_Route = '/login';
  static const String Signup_Route = '/signup';
  static const String Dashboard_Route = '/dashboard';

  static Map<String,WidgetBuilder> mRoutes = {
    Splash_Route : (context) => SplashPage(),
    Login_Route : (context) => LoginPage(),
    Signup_Route : (context) => SignupPage(),
    Dashboard_Route : (context) => DashboardPage(),
  };


}