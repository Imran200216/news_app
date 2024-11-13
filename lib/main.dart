import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/provider/all_news_provider.dart';
import 'package:news_app/provider/auth_provider/email_auth_provider.dart';
import 'package:news_app/provider/auth_provider/google_auth_provider.dart';
import 'package:news_app/provider/book_mark_provider.dart';
import 'package:news_app/provider/bottom_nav_provider.dart';
import 'package:news_app/provider/carousel_provider.dart';
import 'package:news_app/provider/category_chip_provider.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/provider/topic_provider.dart';
import 'package:news_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

          /// carousel provider
          ChangeNotifierProvider(
            create: (context) => CarouselIndexProvider(),
          ),

          /// news provider
          ChangeNotifierProvider(
            create: (context) => NewsProvider(),
          ),

          /// google auth Provider
          ChangeNotifierProvider(
            create: (context) => GoogleAuthenticationProvider(),
          ),

          /// email auth provider
          ChangeNotifierProvider(
            create: (context) => EmailAuthenticationProvider(),
          ),

          /// all news provider
          ChangeNotifierProvider(
            create: (context) => AllNewsProvider(),
          ),

          /// book mark provider
          ChangeNotifierProvider(
            create: (context) => BookMarkProvider(),
          ),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData(
              textTheme: GoogleFonts.interTextTheme(),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          );
        });
  }
}
