import 'package:flutter/material.dart';
import 'package:tap2024/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isValidating = false;

  @override
  Widget build(BuildContext context) {

    final txtUser = TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Correo Electronico',
        hintStyle: TextStyle(fontWeight: FontWeight.bold)
      ),
    );

    final txtPwd = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.key),
        hintText: 'Contraseña',
        hintStyle: TextStyle(fontWeight: FontWeight.bold)
      ),
    );

    return Scaffold(
      /*body: Center(
        child: Lottie.asset('/assets/Animation - 1712709711403.json'),*/
        body: Container(
          padding: const EdgeInsets.all(10),
          //color: Colors.amber,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: .5,
              fit: BoxFit.fill,
              image: AssetImage('assets/fondo.jpg'),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 200,
                child: Image.asset('assets/fondo2.jpg')
              ),
              Positioned(
                bottom:150,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  //color: Colors.amber,
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 86, 195, 88),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: 
                    [
                      txtUser, txtPwd
                    ],
                  )
                )
              ),
              Positioned(
                bottom: 90,
                child: ElevatedButton.icon(
                  onPressed: (){
                    isValidating = !isValidating;
                    setState(() {});
                      Future.delayed(const Duration(
                        milliseconds: 3000
                      )).then((value) => Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context)=> const HomeScreen()
                        )
                      )
                    );
                  }, 
                  icon: const Icon(Icons.login), 
                  label: const Text('Valida Usaario'),
                  ), 
              ),
              Positioned(
                top: 320,
                child: SizedBox(
                 height: 100,
                child: isValidating ? Image.asset('assets/load.gif') : 
                  Container(
                    
                  )
                )
              )
            ],
          )
        ),
    );
  }
}