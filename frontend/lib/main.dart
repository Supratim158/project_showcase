import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:project_showcase/pages/componets/bottom_nav_bar.dart';
import 'package:project_showcase/pages/componets/side_menu.dart';
import 'package:project_showcase/pages/home_page.dart';
import 'package:project_showcase/pages/login/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notifiers/animation_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? '';
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final token;

  const MyApp({
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTokenValid = token.isNotEmpty && !JwtDecoder.isExpired(token);

    return ChangeNotifierProvider(
      create: (context) => AnimationNotifier(),
      child: MaterialApp(
        title: 'Project Showcase',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: isTokenValid ?
        BottomNavBar()
            : const OnboardingScreen(),
        debugShowCheckedModeBanner: false,
        // home: BottomNavBar(),
      )
    );
  }
}
