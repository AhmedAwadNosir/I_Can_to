import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ican_to/core/utils/app_routs.dart';
import 'package:ican_to/core/utils/constans.dart';
import 'package:ican_to/core/utils/service_locator.dart';
import 'package:ican_to/features/Onboarding/presentation/Views/splash_view.dart';
import 'package:ican_to/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isViewed;
bool? isLoginIn;
bool? isLoginskiped;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white, // Set the status bar color to white
      systemNavigationBarColor: Colors.white
      // Set the status bar icons to dark
      ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getBool("isViewd");
  isLoginIn = prefs.containsKey(isLogin);
  isLoginskiped = prefs.containsKey(loginSkiped);
  setupServicLocator();
  runApp(const ICanToApp());
}

class ICanToApp extends StatelessWidget {
  const ICanToApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: AppRoutes.routes,
      initialRoute: SplashView.id,
    );
  }
}
