import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/provider/bottom_nav_provider.dart';
import 'package:news_app/provider/category_chip_provider.dart';
import 'package:news_app/provider/topic_provider.dart';
import 'package:news_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          /// bottom nav provider
          ChangeNotifierProvider(
            create: (context) => BottomNavProvider(),
          ),

          /// topic provider
          ChangeNotifierProvider(
            create: (context) => TopicsProvider(),
          ),

          /// category provider
          ChangeNotifierProvider(
            create: (context) => CategoryChipProvider(),
          ),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              textTheme: GoogleFonts.interTextTheme(),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          );
        });
  }
}
