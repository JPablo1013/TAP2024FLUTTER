import 'package:flutter/material.dart';

class ThemeSettings{
  static ThemeData lightTheme(context){
    final theme = ThemeData.light().copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
      primary: Colors.green
    )
    );
    return theme;
  }

  static ThemeData darkTheme(context){
    final theme = ThemeData.light().copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
      primary: Colors.blue
    )
    );
    return theme;
  }
}