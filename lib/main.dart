import "package:flutter/material.dart";
import 'package:hive_flutter/hive_flutter.dart';
import "package:todo/pages/home_page.dart";
import 'package:flutter/services.dart';

void main() async {
  //init hive
  await Hive.initFlutter();
  //open a box
  var box = await Hive.openBox('mybox');

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
