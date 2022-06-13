import 'package:flutter/material.dart';
import 'package:muslim/shared/remote/dio/dio_helper.dart';

import 'modules/home_page/home_page_screen.dart';
import 'modules/main_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(MyApp());
  print("${(0+1).toString().padLeft(3,'0')}");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MainScreen(),
    );
  }
}
