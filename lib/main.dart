import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:reservebite/routes/routes_initilization.dart';
import 'package:reservebite/routes/routes_names.dart';
import 'package:reservebite/views/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  await dotenv.load(fileName: ".env");

  final supabaseUrl = dotenv.env['SUPABASE_URL']!;
  final supabaseKey = dotenv.env['SUPABASE_ANON_KEY']!;
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  runApp(MainScreen() );
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: RoutesNames.splash,
        getPages:RoutesInitilization.pages,
      debugShowCheckedModeBanner: false,
      home:SplashScreen()
    );
  }
}
