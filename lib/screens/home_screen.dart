//import 'dart:ffi';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:tap2024/settings/value_listener.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topicos Avanzados'),
      ),
      drawer: menuLateral(context),
    ); 
  }
  Widget menuLateral(BuildContext context){
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/fondo.jpg')
                )
        ),     
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.iskc3y_jG34WqD5_SVFBwwHaGw?rs=1&pid=ImgDetMain'),
              ),
              accountName: Text('Rubensin Torres Frias'),
             accountEmail: Text('20031600@itcelaya.edu.mx')
            ),
          ListTile(
              tileColor: Colors.greenAccent,
              title: Text('Login'),
              subtitle: Text('Direccion de Youtube'),
              leading: Icon(Icons.key),
              trailing: Icon(Icons.chevron_right),
              //onTap: ()=>Navigator.pushNamed(context, '/home'),
              onTap: ()=>Navigator.pushNamed(context, '/login2'),
            ),

            ListTile(
              tileColor: Colors.greenAccent,
              title: Text('Intenciones'),
              subtitle: Text('Acciones Implicitas'),
              leading: Icon(Icons.abc),
              trailing: Icon(Icons.chevron_right),
              //onTap: ()=>Navigator.pushNamed(context, '/home'),
              onTap: ()=>Navigator.pushNamed(context, "/intent"),
            ),
            DayNightSwitcher(
              isDarkModeEnabled: ValueListener.isDark.value, 
              onStateChanged: (onStateChanged){
                ValueListener.isDark.value = true;
              },
            )
          ],
        ),
      ),
    );
  }
}