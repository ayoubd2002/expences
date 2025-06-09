import 'package:expences/screens/expence.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var colorss = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 4, 1, 74));
var darktheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 0, 0));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: colorss,
            appBarTheme: AppBarTheme().copyWith(
              backgroundColor: colorss.onPrimaryContainer,
              foregroundColor: colorss.primaryContainer,
            ),
            cardTheme: CardTheme().copyWith(
                color: colorss.secondaryContainer,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: colorss.primaryContainer))),
        darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: darktheme,
            appBarTheme: AppBarTheme().copyWith(
              backgroundColor: darktheme.onPrimaryContainer,
              foregroundColor: darktheme.primaryContainer,
            ),
            bottomSheetTheme: BottomSheetThemeData().copyWith(
              backgroundColor: darktheme.onPrimaryContainer,
            ),
            cardTheme: CardTheme().copyWith(
                color: darktheme.secondaryContainer,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: darktheme.primaryContainer))),
        debugShowCheckedModeBanner: false,
        home: Expences());
  }
}
