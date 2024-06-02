import 'package:flutter/material.dart';
import 'login.dart';
import 'settings.dart';

class ProfilePage extends StatelessWidget {
  final String username = 'Usuario_admin';
  final String fullName = 'Diego Rodríguez';
  final String email = 'micorreo@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HackApp',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 60, // Incrementa el tamaño de la foto de perfil
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Mi Perfil',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Accede y modifica tus datos de perfil',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text(
                'Nombre de Usuario',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: Text(
                username,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            ListTile(
              title: Text(
                'Nombre Completo',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: Text(
                fullName,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            ListTile(
              title: Text(
                'Correo Electrónico',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: Text(
                email,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Cambiar Contraseña'),
                      content: Text(
                          'Se ha enviado un correo electrónico para cambiar tu contraseña.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Cambiar Contraseña',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Cerrar Sesión',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: Colors.grey[800],
            height: 1,
          ),
          BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            currentIndex: 1, // Seleccionar la página actual (Perfil)
            onTap: (int index) {
              if (index == 0) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else if (index == 1) {
                // Ya estamos en la página de perfil, no hacer nada
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Ajustes',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
