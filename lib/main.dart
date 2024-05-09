import 'package:flutter/material.dart';
import 'package:tap2024/screens/home_screen.dart';
import 'package:tap2024/screens/intenciones_screen.dart';
import 'package:tap2024/screens/login_screen2.dart';
import 'package:tap2024/screens/popular_screen.dart';
import 'package:tap2024/screens/splash_screen.dart';
import 'package:tap2024/settings/theme_settings.dart';
import 'package:tap2024/settings/value_listener.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: ValueListener.isDark,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: PopularScreen(),
          theme: value 
            ? ThemeSettings.darkTheme(context) 
            : ThemeSettings.lightTheme(context),
          routes: {
            "/home" :(context) => const HomeScreen(),
            "/login2":(context) =>const LoginScreen2(),
            "/intent": (context) => const IntencionesScreen()
          },
          //'/register': (context) => RegisterScreen(),
        );
      }
    );
  }
}



/*class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('stateful vs Stateless'),
        ),
        body: Center( 
          child: Text('valor del contador $contador'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_alarm),
          onPressed: (){
            contador++;
            //print(contador);
            setState(() {
            });
          }
          ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

    int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('stateful vs Stateless'),
        ),
        body: Center( 
          child: Text('valor del contador $contador'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_alarm),
          onPressed: (){
            contador++;
            print(contador);
          }
          ),
      ),
    );
  }
}*/