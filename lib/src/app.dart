import 'package:flutter/material.dart';
import 'package:stotppub/src/core/config/app_router.dart';
import 'package:stotppub/src/core/presentacion/screens/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   useMaterial3: false,
      // ),
      // home: const SignInScreen(),
      routerConfig: appRouter,
    );
  }
}
