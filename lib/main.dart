import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:theweather/consts/boxes.dart';
import 'package:theweather/consts/colors.dart';
import 'package:theweather/consts/styles.dart';
import 'package:theweather/hive_database/locations.dart';
import 'package:theweather/loading_page.dart';
import 'package:theweather/viewmodals/first_page_view_modal.dart';
import 'package:theweather/viewmodals/second_page_view_modal.dart';
import 'package:theweather/viewmodals/third_page_view_modal.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocationsAdapter());
  boxLocations = await Hive.openBox<Locations>('locationsBox');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FirstPageViewModal()),
    ChangeNotifierProvider(create: (context) => SecondPageViewModal()),
    ChangeNotifierProvider(
      create: (context) => ThirdPageViewModal(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: myLightPurple,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: myLightPurple,
            showSelectedLabels: true,
            unselectedLabelStyle:
                MyStyles.myBlack.copyWith(fontWeight: FontWeight.bold),
            selectedLabelStyle:
                MyStyles.myBlack.copyWith(fontWeight: FontWeight.bold),
            selectedItemColor: myBlack,
            selectedIconTheme: const IconThemeData(
              color: Colors.purple,
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: const LoadingPage(),
    );
  }
}
