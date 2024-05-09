import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IntencionesScreen extends StatelessWidget {
  const IntencionesScreen({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( 'Intenciones: '),),
      body: GridView( 
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8
         ),
        children: [
          intentCard(icon: Icons.web_stories, title: 'https://itcelaya.edu.mx',sizeletter: 20, actionFunction: openweb),
          intentCard(title: 'tel: 4612279093', icon: Icons.phone_android_rounded,sizeletter: 20,actionFunction: callPhone),
          intentCard(title: 'sms: 4612279093', icon: Icons.sms,sizeletter: 20, actionFunction:sendSMS),
          intentCard(title: 'Email: ruben.torres@itcelaya.edu.mx', icon: Icons.email,sizeletter: 20, actionFunction: sendEmail),
        ],
      ),
    );
  }

  openweb() async{
    Uri uri = Uri.parse('https://celaya.tecnm.mx/');
    if(await canLaunchUrl(uri)){
      launchUrl(uri);
    }
  }
  callPhone()async{
    Uri uri = Uri.parse('tel: 4612279093'); 
    if(await canLaunchUrl(uri)){
      launchUrl(uri);
    }
  }
  sendSMS()async{
    Uri uri = Uri.parse('sms: 4612279093'); 
    if(await canLaunchUrl(uri)){
      launchUrl(uri);
    }
  }
  sendEmail()async{
    Uri uri = Uri(
      scheme:'mailto',
      path: 'isctorres@gmail.com',
      query: 'subject=Hola Mundo! :)&body=Feliz dea del niño '
    );

    if(await canLaunchUrl(uri)){
      launchUrl(uri);
    }

  }
}


  Widget intentCard({required String title , required IconData icon, double sizeletter = 25, Function()? actionFunction}){
    return GestureDetector(
      onTap: actionFunction,
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent[100]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80,),
            Text(title,style: TextStyle(fontSize: sizeletter),)
          ],
        ),
      ),
    );
  }