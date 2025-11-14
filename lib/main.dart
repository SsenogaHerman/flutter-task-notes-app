import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_notes_manager/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:task_notes_manager/screens/screen2.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool theme = false; // track light/dark mode

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      theme = savedTheme;
    });
  }

  void _updateTheme(bool newValue) async {
    setState(() {
      theme = newValue;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', newValue);
  }


  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => Home(
            theme: theme,
              onThemeChanged: _updateTheme,

          ),
        ),
        GoRoute(
          name: 'Screen2',
          path: '/Screen2',
          builder: (context, state) => const Screen2(),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: theme ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routerConfig: _router,
    );
  }
}

