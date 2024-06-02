import 'package:flutter/material.dart';
import 'video.dart';
import 'profile.dart'; // Importar ProfilePage
import 'settings.dart'; // Importar SettingsPage
import 'faq.dart'; // Importar FAQPage
import 'feedback.dart'; // Importar FeedbackPage

void main() {
  runApp(HackApp());
}

class HackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackApp',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showRedDot = true;

  final Map<String, Map<String, dynamic>> categories = {
    'Usuario Doméstico': {
      'videoUrl': 'https://youtu.be/QTup2FH_pNk?si=kBMoGxCxHBx-kYns',
      'description': 'Bienvenido a la era de la ciberseguridad 🏠. En este video, aprenderás las mejores prácticas para proteger tu red doméstica y tus dispositivos.',
      'thumbnail': 'https://disitalent.com/wp-content/uploads/2023/10/ciberseguridad-curso.jpg',
      'icon': Icons.home_outlined,
      'explanation': 'Desliza para encontrar la sección de retos y ganar puntos, y finalmente llegar a los consejos finales.',
      'challenges': [
        {
          'question': '¿Cuál es la mejor manera de proteger tu red doméstica? 🔒',
          'options': ['Usar WPA2', 'Usar WEP', 'No usar contraseña'],
          'correctOption': 'Usar WPA2',
          'imagePath': 'assets/images/usuario.jpg',
        },
        {
          'question': '¿Qué debes hacer si recibes un correo electrónico sospechoso? 📧',
          'options': ['Abrir el enlace', 'Eliminarlo', 'Reenviarlo a tus contactos'],
          'correctOption': 'Eliminarlo',
          'imagePath': 'assets/images/usuario.jpg',
        },
        {
          'question': '¿Cuál es una buena práctica para crear contraseñas seguras? 🔐',
          'options': ['Usar tu nombre', 'Usar una combinación de letras, números y símbolos', 'Usar "123456"'],
          'correctOption': 'Usar una combinación de letras, números y símbolos',
          'imagePath': 'assets/images/usuario.jpg',
        },
      ],
      'tips': [
        {
          'number': 1,
          'title': 'Usa contraseñas fuertes y únicas para cada una de tus cuentas. 🔐',
          'imagePath': 'assets/images/usuario.jpg',
        },
        {
          'number': 2,
          'title': 'Mantén tu software siempre actualizado para protegerte contra las amenazas más recientes. 🛡️',
          'imagePath': 'assets/images/usuario.jpg',
        },
        {
          'number': 3,
          'title': 'Desconfía de los correos electrónicos no solicitados, podrían ser intentos de phishing. 📧',
          'imagePath': 'assets/images/usuario.jpg',
        },
        {
          'number': 4,
          'title': 'Usa autenticación de dos factores siempre que sea posible. ✅',
          'imagePath': 'assets/images/usuario.jpg',
        },
        {
          'number': 5,
          'title': 'Evita conectarte a redes Wi-Fi públicas sin protección. 🌐',
          'imagePath': 'assets/images/usuario.jpg',
        },
      ],
    },
    'Profesional Remoto': {
      'videoUrl': 'https://www.youtube.com/watch?v=VIDEO_ID2',
      'description': 'Trabajar desde casa puede ser cómodo, pero también implica riesgos de ciberseguridad 📡. Aprende a protegerte mientras trabajas remotamente.',
      'thumbnail': 'https://gestion.pe/resizer/ZdcP6qR3UCqru-pivqY0N1vzqj8=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/FWSVO7GXIVGRRD73OLWJ53VDMU.jpg',
      'icon': Icons.work_outline,
      'explanation': 'Desliza para encontrar la sección de retos y ganar puntos, y finalmente llegar a los consejos finales.',
      'challenges': [
        {
          'question': '¿Cuál es la mejor práctica para proteger tus datos en una red Wi-Fi pública? 🌐',
          'options': ['Usar VPN', 'Conectarse sin protección', 'Usar WEP'],
          'correctOption': 'Usar VPN',
          'imagePath': 'assets/images/remoto.png',
        },
        {
          'question': '¿Qué debes hacer si recibes un enlace sospechoso en un correo electrónico? 📧',
          'options': ['Abrir el enlace', 'Eliminarlo', 'Reenviarlo a tus contactos'],
          'correctOption': 'Eliminarlo',
          'imagePath': 'assets/images/remoto.png',
        },
        {
          'question': '¿Cuál es una buena práctica para proteger tus dispositivos de trabajo? 🔐',
          'options': ['Usar contraseñas complejas', 'Dejarlos sin protección', 'Usar la misma contraseña para todo'],
          'correctOption': 'Usar contraseñas complejas',
          'imagePath': 'assets/images/remoto.png',
        },
      ],
      'tips': [
        {
          'number': 1,
          'title': 'Usa contraseñas fuertes y únicas para cada una de tus cuentas. 🔐',
          'imagePath': 'assets/images/remoto.png',
        },
        {
          'number': 2,
          'title': 'Mantén tu software siempre actualizado para protegerte contra las amenazas más recientes. 🛡️',
          'imagePath': 'assets/images/remoto.png',
        },
        {
          'number': 3,
          'title': 'Desconfía de los correos electrónicos no solicitados, podrían ser intentos de phishing. 📧',
          'imagePath': 'assets/images/remoto.png',
        },
        {
          'number': 4,
          'title': 'Usa autenticación de dos factores siempre que sea posible. ✅',
          'imagePath': 'assets/images/remoto.png',
        },
        {
          'number': 5,
          'title': 'Evita conectarte a redes Wi-Fi públicas sin protección. 🌐',
          'imagePath': 'assets/images/remoto.png',
        },
      ],
    },
    'Administrador Informática': {
      'videoUrl': 'https://www.youtube.com/watch?v=VIDEO_ID3',
      'description': 'Como administrador de TI, es crucial conocer las últimas estrategias para proteger la infraestructura de tu empresa 💼. Este video te guiará a través de ellas.',
      'thumbnail': 'https://www.unir.net/wp-content/uploads/sites/22/2021/06/beautiful-male-computer-engineer-and-scientists-create-neural-network-picture-id1182697690.jpg',
      'icon': Icons.admin_panel_settings_outlined,
      'explanation': 'Desliza para encontrar la sección de retos y ganar puntos, y finalmente llegar a los consejos finales.',
      'challenges': [
        {
          'question': '¿Cuál es la mejor manera de proteger la red de tu empresa? 🔒',
          'options': ['Usar firewall avanzado', 'Usar WEP', 'No usar protección'],
          'correctOption': 'Usar firewall avanzado',
          'imagePath': 'assets/images/admin.jpg',
        },
        {
          'question': '¿Qué debes hacer si detectas una intrusión en la red? 📡',
          'options': ['Ignorarla', 'Reportarla', 'Reiniciar el sistema'],
          'correctOption': 'Reportarla',
          'imagePath': 'assets/images/admin.jpg',
        },
        {
          'question': '¿Cuál es una buena práctica para la gestión de contraseñas en la empresa? 🔐',
          'options': ['Usar "123456"', 'Usar un gestor de contraseñas', 'Usar la misma para todo'],
          'correctOption': 'Usar un gestor de contraseñas',
          'imagePath': 'assets/images/admin.jpg',
        },
      ],
      'tips': [
        {
          'number': 1,
          'title': 'Implementa políticas de seguridad estrictas en la empresa. 🔐',
          'imagePath': 'assets/images/admin.jpg',
        },
        {
          'number': 2,
          'title': 'Mantén el software de la empresa siempre actualizado. 🛡️',
          'imagePath': 'assets/images/admin.jpg',
        },
        {
          'number': 3,
          'title': 'Realiza auditorías de seguridad periódicas. 📊',
          'imagePath': 'assets/images/admin.jpg',
        },
        {
          'number': 4,
          'title': 'Educa a los empleados sobre la ciberseguridad. ✅',
          'imagePath': 'assets/images/admin.jpg',
        },
        {
          'number': 5,
          'title': 'Monitorea la red constantemente para detectar amenazas. 🌐',
          'imagePath': 'assets/images/admin.jpg',
        },
      ],
    },
    'Adolescente Redes Sociales': {
      'videoUrl': 'https://www.youtube.com/watch?v=VIDEO_ID4',
      'description': 'Las redes sociales son geniales para conectarse con amigos, pero también pueden ser peligrosas 👫. Aprende a mantenerte seguro en línea.',
      'thumbnail': 'https://www.ftcollinsimagine.com/wp-content/uploads/2022/06/Social-Media-Effects-on-Teens-Relationships-.jpeg',
      'icon': Icons.people_outline,
      'explanation': 'Desliza para encontrar la sección de retos y ganar puntos, y finalmente llegar a los consejos finales.',
      'challenges': [
        {
          'question': '¿Qué debes hacer si un desconocido te envía una solicitud de amistad? 🤔',
          'options': ['Aceptar', 'Ignorar', 'Investigar'],
          'correctOption': 'Ignorar',
          'imagePath': 'assets/images/adolescente.jpg',
        },
        {
          'question': '¿Cuál es una buena práctica para compartir fotos en redes sociales? 📸',
          'options': ['Publicar todo', 'No compartir información personal', 'Etiquetar a todos'],
          'correctOption': 'No compartir información personal',
          'imagePath': 'assets/images/adolescente.jpg',
        },
        {
          'question': '¿Qué debes hacer si alguien te acosa en línea? 🚨',
          'options': ['Bloquear y reportar', 'Ignorar', 'Responder agresivamente'],
          'correctOption': 'Bloquear y reportar',
          'imagePath': 'assets/images/adolescente.jpg',
        },
      ],
      'tips': [
        {
          'number': 1,
          'title': 'Configura la privacidad de tus cuentas en redes sociales. 🔒',
          'imagePath': 'assets/images/adolescente.jpg',
        },
        {
          'number': 2,
          'title': 'No aceptes solicitudes de amistad de desconocidos. ❌',
          'imagePath': 'assets/images/adolescente.jpg',
        },
        {
          'number': 3,
          'title': 'No compartas información personal en tus publicaciones. 📵',
          'imagePath': 'assets/images/adolescente.jpg',
        },
        {
          'number': 4,
          'title': 'Bloquea y reporta a cualquier persona que te acose en línea. 🚫',
          'imagePath': 'assets/images/adolescente.jpg',
        },
        {
          'number': 5,
          'title': 'Mantén tus dispositivos protegidos con contraseñas seguras. 🔐',
          'imagePath': 'assets/images/adolescente.jpg',
        },
      ],
    },
    'Emprendedor E-commerce': {
      'videoUrl': 'https://www.youtube.com/watch?v=VIDEO_ID5',
      'description': 'El comercio electrónico está en auge 🚀, pero también lo están los ciberataques. Este video te enseñará cómo mantener tu negocio en línea seguro.',
      'thumbnail': 'https://www.digitalpiloto.com/blog/wp-content/uploads/2022/05/cyber-security-enhances-e-commerce-business.jpg',
      'icon': Icons.shopping_cart_outlined,
      'explanation': 'Desliza para encontrar la sección de retos y ganar puntos, y finalmente llegar a los consejos finales.',
      'challenges': [
        {
          'question': '¿Cuál es la mejor manera de proteger los datos de tus clientes? 🔒',
          'options': ['No hacer nada', 'Encriptarlos', 'Compartirlos'],
          'correctOption': 'Encriptarlos',
          'imagePath': 'assets/images/comercio.png',
        },
        {
          'question': '¿Qué debes hacer si detectas una brecha de seguridad en tu sitio web? 🚨',
          'options': ['Ignorarla', 'Informar a los clientes y solucionar', 'Cerrar el sitio web'],
          'correctOption': 'Informar a los clientes y solucionar',
          'imagePath': 'assets/images/comercio.png',
        },
        {
          'question': '¿Cuál es una buena práctica para proteger tu tienda en línea? 🔐',
          'options': ['Usar contraseñas simples', 'Implementar autenticación de dos factores', 'Permitir el acceso a todos'],
          'correctOption': 'Implementar autenticación de dos factores',
          'imagePath': 'assets/images/comercio.png',
        },
      ],
      'tips': [
        {
          'number': 1,
          'title': 'Usa certificados SSL para asegurar las transacciones en tu sitio. 🔒',
          'imagePath': 'assets/images/comercio.png',
        },
        {
          'number': 2,
          'title': 'Realiza copias de seguridad periódicas de tu sitio web. 💾',
          'imagePath': 'assets/images/comercio.png',
        },
        {
          'number': 3,
          'title': 'Monitorea tu sitio para detectar actividades sospechosas. 🕵️',
          'imagePath': 'assets/images/comercio.png',
        },
        {
          'number': 4,
          'title': 'Educa a tus empleados sobre prácticas de seguridad en línea. 📚',
          'imagePath': 'assets/images/comercio.png',
        },
        {
          'number': 5,
          'title': 'Mantén tus plataformas de comercio electrónico siempre actualizadas. 🔄',
          'imagePath': 'assets/images/comercio.png',
        },
      ],
    },
  };

  void _showUpdates(BuildContext context) {
    setState(() {
      _showRedDot = false;
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Últimas Mejoras'),
        content: Text(
          '1. Mejoras en la interfaz de usuario.\n'
              '2. Optimización de rendimiento.\n'
              '3. Corrección de errores menores.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

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
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: Colors.white),
                onPressed: () => _showUpdates(context),
              ),
              if (_showRedDot)
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Selecciona tu Categoría',
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10), // Reducido el espacio entre el título y la primera categoría
                    ...categories.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CategoryItem(
                          icon: entry.value['icon'],
                          title: entry.key,
                          imagePath: entry.value['thumbnail'],
                          actionText: 'Seleccionar',
                          videoUrl: entry.value['videoUrl'],
                          description: entry.value['description'],
                          explanation: entry.value['explanation'],
                          challenges: entry.value['challenges'],
                          tips: entry.value['tips'],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[800],
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'HackApp Solutions 2024 ©',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
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

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String imagePath;
  final String actionText;
  final String videoUrl;
  final String description;
  final String explanation;
  final List<Map<String, dynamic>> challenges;
  final List<Map<String, dynamic>> tips;

  CategoryItem({
    required this.icon,
    required this.title,
    required this.imagePath,
    required this.actionText,
    required this.videoUrl,
    required this.description,
    required this.explanation,
    required this.challenges,
    required this.tips,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 20), // Icono más pequeño
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.cyan],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPage(
                      title: title,
                      videoUrl: videoUrl,
                      description: description,
                      challenges: challenges,
                      tips: tips,
                      explanation: explanation,
                      thumbnail: imagePath,
                    ),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide.none, // Para eliminar el borde original
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                actionText,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
