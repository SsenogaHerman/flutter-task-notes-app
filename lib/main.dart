import 'package:flutter/material.dart';
import 'package:task_notes_manager/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:task_notes_manager/screens/screen2.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,


    );
  }

  final GoRouter _router=GoRouter(
    routes: [
      GoRoute(name: 'home',path: '/',builder: (context,state)=>const Home()),
      GoRoute(name: 'Screen2',path: '/Screen2',builder: (context,state)=>const Screen2())
    ]

  );


}
