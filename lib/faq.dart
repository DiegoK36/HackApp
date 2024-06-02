import 'package:flutter/material.dart';
import 'profile.dart';
import 'settings.dart';
import 'feedback.dart';

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqData = [
    {
      'question': '¿Qué es HackApp? 🤔',
      'answer': 'HackApp es una aplicación diseñada para ayudarte a aprender y practicar ciberseguridad a través de desafíos y consejos interactivos.',
    },
    {
      'question': '¿Cómo son los retos? 🏆',
      'answer': 'Cada categoría tiene una serie de retos que puedes completar para ganar puntos. Los retos están diseñados para ser educativos y desafiantes.',
    },
    {
      'question': '¿Cómo se guardan mis puntos? 💾',
      'answer': 'Tus puntos se guardan automáticamente en tu perfil y puedes verlos en cualquier momento. Además, puedes resetear los retos y volver a intentarlo.',
    },
    {
      'question': '¿Cómo puedo cambiar mi contraseña? 🔒',
      'answer': 'En tu perfil, selecciona la opción para cambiar la contraseña. Te enviaremos un correo electrónico con instrucciones para hacerlo.',
    },
    {
      'question': '¿Qué hago si encuentro un error? 🐞',
      'answer': 'Si encuentras un error, puedes enviarnos un feedback a través de la sección de Feedback en el menú. ¡Agradecemos tu ayuda para mejorar la aplicación!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'HackApp',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(width: 8), // Espacio entre el texto y la flecha
            PopupMenuButton<int>(
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ajustes',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sobre Nosotros',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.info, color: Colors.white),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Feedback',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.feedback, color: Colors.white),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'FAQ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.help, color: Colors.white),
                    ],
                  ),
                ),
              ],
              color: Colors.grey[850], // Fondo gris oscuro
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[800],
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqData.length,
          itemBuilder: (context, index) {
            final faq = faqData[index];
            return ExpansionTile(
              title: Text(
                faq['question']!,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    faq['answer']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      color: Colors.white70,
                    ),
                  ),
                ),
                Divider(color: Colors.grey[800], thickness: 1),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          if (index == 0) {
            Navigator.popUntil(context, (route) => route.isFirst);
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
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
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsPage(),
          ),
        );
        break;
      case 1:
      // Acción para "Sobre Nosotros"
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FeedbackPage(),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FAQPage(),
          ),
        );
        break;
    }
  }
}
