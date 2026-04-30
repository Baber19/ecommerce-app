import 'package:ecommercer_app/app_routes.dart';
import 'package:ecommercer_app/data/api_helper.dart';
import 'package:ecommercer_app/ui/on_boarding/bloc/user_bloc.dart';
import 'package:ecommercer_app/ui/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers:[
      BlocProvider(
        create: (context) => UserBloc(apiHelper: ApiHelper(),
        ),
      ),
        BlocProvider(
          create: (context) => ProductBloc(apiHelper: ApiHelper(),
          ),
        ),

  ], child: MyApp(),
    ),
  
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.Splash_Route,
      routes: AppRoutes.mRoutes,
    );
  }
}
