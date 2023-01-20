import 'package:awesome_app/view/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navKey = GlobalKey();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Awesome App',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: const HomePage(),
    );
  }
}
