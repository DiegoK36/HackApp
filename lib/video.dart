import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile.dart';  // Importa la vista de perfil
import 'settings.dart';  // Importa la vista de ajustes

class VideoPage extends StatefulWidget {
  final String title;
  final String videoUrl;
  final String description;
  final List<Map<String, dynamic>> challenges;
  final List<Map<String, dynamic>> tips;
  final String thumbnail;
  final String explanation;

  VideoPage({
    required this.title,
    required this.videoUrl,
    required this.description,
    required this.challenges,
    required this.tips,
    required this.thumbnail,
    required this.explanation,
  });

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final PageController _pageController = PageController();
  double _progress = 0.20;
  int _currentQuestion = 0;
  int _points = 0;
  List<bool> _answeredQuestions = [];
  bool _showResetButton = false;

  @override
  void initState() {
    super.initState();
    _answeredQuestions = List<bool>.filled(widget.challenges.length, false);
    _loadPoints();
  }

  void _launchURL() async {
    if (await canLaunch(widget.videoUrl)) {
      await launch(widget.videoUrl);
    } else {
      throw 'Could not launch ${widget.videoUrl}';
    }
  }

  void _nextQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        _points += 10; // Increase points for correct answer
      });
    }
    setState(() {
      _answeredQuestions[_currentQuestion] = true;
      if (_currentQuestion < widget.challenges.length - 1) {
        _currentQuestion++;
        _progress += 0.20;
      } else {
        _progress = 1.0;
        _showResetButton = true;
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
      _savePoints();
    });
  }

  void _resetQuiz() {
    setState(() {
      _points = 0;
      _currentQuestion = 0;
      _progress = 0.20;
      _showResetButton = false;
      _answeredQuestions = List<bool>.filled(widget.challenges.length, false);
    });
    _savePoints();
  }

  Future<void> _savePoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('points', _points);
  }

  Future<void> _loadPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _points = prefs.getInt('points') ?? 0;
    });
  }

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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.emoji_events, color: Colors.yellow),
                SizedBox(width: 4),
                Text(
                  '$_points',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          if (page == 1) {
            setState(() {
              _progress = 0.40;
            });
          } else if (page == 2) {
            setState(() {
              _progress = 0.60;
            });
          } else if (page == 3) {
            setState(() {
              _progress = 0.80;
            });
          } else if (page == 4) {
            setState(() {
              _progress = 1.0;
            });
          }
        },
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.grey[700],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: _launchURL,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          widget.thumbnail, // Miniatura del video
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 64,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  widget.explanation,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Center(
                  child: Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white.withOpacity(0.7),
                    size: 48,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          ...List.generate(widget.challenges.length, (index) {
            final challenge = widget.challenges[index];
            final isAnswered = _answeredQuestions[index];
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Retos de Ciberseguridad',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: _progress,
                    backgroundColor: Colors.grey[700],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      challenge['question'],
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      challenge['imagePath'] ?? 'assets/images/default.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 20),
                  for (var option in challenge['options'])
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
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
                            color: isAnswered
                                ? (option == challenge['correctOption']
                                ? Colors.green
                                : Colors.red)
                                : Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: OutlinedButton(
                            onPressed: isAnswered
                                ? null
                                : () {
                              final isCorrect = option == challenge['correctOption'];
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(isCorrect ? '¡Correcto!' : 'Incorrecto'),
                                    content: Text(
                                      isCorrect
                                          ? '¡Bien hecho! Sabes cómo proteger tu seguridad.'
                                          : 'La respuesta correcta es: ${challenge['correctOption']}. ${option == 'Abrir el enlace' ? 'Nunca abras enlaces de correos sospechosos.' : ''} ${option == 'Usar WEP' ? 'WEP es un protocolo de seguridad antiguo y menos seguro.' : ''}',
                                      textAlign: TextAlign.justify,
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          _nextQuestion(isCorrect);
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              option,
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
                    ),
                  if (_showResetButton && index == widget.challenges.length - 1)
                    Center(
                      child: IconButton(
                        icon: Icon(Icons.replay, color: Colors.blue, size: 36),
                        onPressed: _resetQuiz,
                      ),
                    ),
                ],
              ),
            );
          }),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    'Consejos de Ciberseguridad',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.grey[700],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
                SizedBox(height: 20),
                _buildTipsSection(),
              ],
            ),
          ),
        ],
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
            onTap: (int index) {
              if (index == 0) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
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

  Widget _buildTipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widget.tips.map((tip) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  tip['imagePath'],
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Consejo ${tip['number']}',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                tip['title'],
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      }).toList(),
    );
  }
}
