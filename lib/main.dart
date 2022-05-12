import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/Screens/splash.dart';
import 'package:flutter_application_3/Services/sharedprefrences.dart';
import 'package:get/get.dart';
import 'Binding/binding.dart';

bool isFirst = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  isFirst = await SharedPrefrencesStorage.getIsFirst();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark))),
        home: const SplashScreen());
  }
}
