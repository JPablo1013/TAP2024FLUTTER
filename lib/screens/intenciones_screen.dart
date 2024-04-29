import 'package:flutter/material.dart';

class IntencionesScreen extends StatelessWidget {
  const IntencionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intenciones :'),),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:  2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8
        ),
        children: [
            intentCard(),
            intentCard(),
            intentCard(),
            intentCard(),
        ],
      ),
    );
  }
  Widget intentCard(){
    return Container(
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueAccent[100]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wallet, size: 80,),
          Text('12345667890', style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}