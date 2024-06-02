import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String language = 'Español';
  String colorCorrection = 'Deuteranomalía';
  int fontSize = 12;
  bool isTalkbackEnabled = false;
  bool isSoundEffectsEnabled = true;
  bool isLargeButtonsEnabled = true;
  bool isVibrationEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
      language = prefs.getString('language') ?? 'Español';
      colorCorrection = prefs.getString('colorCorrection') ?? 'Deuteranomalía';
      fontSize = prefs.getInt('fontSize') ?? 12;
      isTalkbackEnabled = prefs.getBool('isTalkbackEnabled') ?? false;
      isSoundEffectsEnabled = prefs.getBool('isSoundEffectsEnabled') ?? true;
      isLargeButtonsEnabled = prefs.getBool('isLargeButtonsEnabled') ?? true;
      isVibrationEnabled = prefs.getBool('isVibrationEnabled') ?? true;
    });
  }

  Future<void> _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
    await prefs.setString('language', language);
    await prefs.setString('colorCorrection', colorCorrection);
    await prefs.setInt('fontSize', fontSize);
    await prefs.setBool('isTalkbackEnabled', isTalkbackEnabled);
    await prefs.setBool('isSoundEffectsEnabled', isSoundEffectsEnabled);
    await prefs.setBool('isLargeButtonsEnabled', isLargeButtonsEnabled);
    await prefs.setBool('isVibrationEnabled', isVibrationEnabled);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ajustes guardados con éxito'),
        backgroundColor: Colors.blue,
      ),
    );
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[800],
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ajustes',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text(
                'Modo oscuro',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                });
              },
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.red,
            ),
            ListTile(
              title: Text(
                'Idioma',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              trailing: DropdownButton<String>(
                value: language,
                dropdownColor: Colors.grey[850],
                items: <String>['Español', 'Inglés'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    language = newValue!;
                  });
                },
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                underline: SizedBox(),
              ),
            ),
            ListTile(
              title: Text(
                'Corrección de Color',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              trailing: DropdownButton<String>(
                value: colorCorrection,
                dropdownColor: Colors.grey[850],
                items: <String>['Deuteranomalía', 'Protanomalía', 'Tritanomalía'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    colorCorrection = newValue!;
                  });
                },
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                underline: SizedBox(),
              ),
            ),
            ListTile(
              title: Text(
                'Tamaño de la Fuente',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              trailing: DropdownButton<int>(
                value: fontSize,
                dropdownColor: Colors.grey[850],
                items: <int>[10, 12, 14, 16, 18].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    fontSize = newValue!;
                  });
                },
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                underline: SizedBox(),
              ),
            ),
            SwitchListTile(
              title: Text(
                'Talkback',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              value: isTalkbackEnabled,
              onChanged: (bool value) {
                setState(() {
                  isTalkbackEnabled = value;
                });
              },
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.red,
            ),
            SwitchListTile(
              title: Text(
                'Efectos de Sonido',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              value: isSoundEffectsEnabled,
              onChanged: (bool value) {
                setState(() {
                  isSoundEffectsEnabled = value;
                });
              },
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.red,
            ),
            SwitchListTile(
              title: Text(
                'Botones Grandes',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              value: isLargeButtonsEnabled,
              onChanged: (bool value) {
                setState(() {
                  isLargeButtonsEnabled = value;
                });
              },
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.red,
            ),
            SwitchListTile(
              title: Text(
                'Vibración',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              value: isVibrationEnabled,
              onChanged: (bool value) {
                setState(() {
                  isVibrationEnabled = value;
                });
              },
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.red,
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                _saveSettings();
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 48), // Ancho completo
              ),
              child: Text(
                'Guardar',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                ),
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
            currentIndex: 2, // Seleccionar la página actual (Ajustes)
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
}
