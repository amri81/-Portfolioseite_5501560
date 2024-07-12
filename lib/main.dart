import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase Import
import 'package:portfolio_5501560/firebase_options.dart'; // Deine Firebase-Konfiguration

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>();
  }
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amri',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow[50],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow[700],
          foregroundColor: Colors.black,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple[700],
          foregroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: _themeMode,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amri'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.lightbulb : Icons.lightbulb_outline),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
                if (isDarkMode) {
                  MyApp.of(context)?.changeTheme(ThemeMode.dark);
                } else {
                  MyApp.of(context)?.changeTheme(ThemeMode.light);
                }
              });
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Startseite'),
            Tab(icon: Icon(Icons.person), text: 'Über mich'),
            Tab(icon: Icon(Icons.work), text: 'Lebenslauf'),
            Tab(icon: Icon(Icons.school), text: 'Fähigkeiten'),
            Tab(icon: Icon(Icons.contact_mail), text: 'Kontakt'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Startseite(),
          UeberMich(),
          Lebenslauf(),
          Faehigkeiten(),
          Kontakt(),
        ],
      ),
    );
  }
}

class Startseite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Willkommen auf meiner Portfolio-Seite',
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hier finden Sie Informationen über mich und meine Arbeit.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class UeberMich extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Mein Name ist Nouaman Amri, und ich bin ein begeisterter und motivierter Student mit einem starken Interesse an Webentwicklung. '
            'Ich genieße es, an aufregenden Projekten zu arbeiten und meine Fähigkeiten kontinuierlich zu erweitern.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 24),
          Text(
            'Kontaktieren Sie mich:',
            style: TextStyle(fontSize: 24),
          ),
          ElevatedButton(
            onPressed: () {
              launch('mailto:amrinouaman@gmail.com');
            },
            child: Text('E-Mail'),
          ),
          ElevatedButton(
            onPressed: () {
              launch(
                  'https://www.linkedin.com/in/nouaman-amri-9942142a1?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app');
            },
            child: Text('LinkedIn'),
          ),
        ],
      ),
    );
  }
}

class Lebenslauf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'L e b e n s l a u f',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "lib/images/FOTO-CV.jpg",
                    height: 150, // Adjust height as needed
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Name: Nouaman Amri'),
              Text('Adresse: Steinkaute 04, 61169 Friedberg (Hessen)'),
              Text('Telefon: 01575 8216792'),
              Text('E-Mail: amrinouaman@gmail.com'),
              Text('Geburtsdatum: 13.10.2000, Nador, Marokko'),
              SizedBox(height: 20),
              Text('Bildung:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Sept. 2023 - laufend: Technische Hochschule Mittelhessen, '
                  'Fachbereich Wirtschaftsinformatik'),
              Text('Apr. 2022 - Dez. 2022: Studienkolleg Halle-Merseburg, '
                  'Abschluss: Feststellungsprüfung Schwerpunkt Wirtschaft-Kurs, Note: 2,4'),
              Text(
                  'Okt. 2020 - Sept. 2021: Deutschkurs Niveau B1 bei „IMAI“, Nador, Marokko'),
              Text(
                  'Sept. 2016 - Juni 2019: Al Matar Technisch, Gymnasium in Nador, Marokko, '
                  'Abschluss: Abitur, Note: 2,7'),
              SizedBox(height: 20),
              Text('Berufserfahrung:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Nov. 2019 - Feb. 2020: Marchica Conseil in Nador, Marokko, '
                  'Buchhaltungs- und Steuerbüro Assistent (Praktikum)'),
              Text(
                  'Nov. 2020 - Juli 2021: Programmierkurs mit Zertifikat bei „PIGIER“ in Zaio, Marokko'),
              SizedBox(height: 20),
              Text('Software-Kenntnisse:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('. MS Office (PowerPoint, Word, Excel)'),
              Text(
                  '. Programmiersprachen und Frameworks: Java, Dart und Flutter'),
              Text('. Datenbanken und Backend: Firebase'),
              Text(
                  '. Saage-Buchhaltungssoftware: Kenntnisse aus Schule und Praktikum'),
              SizedBox(height: 20),
              Text('Sprachkenntnisse:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  'Amazigh (Muttersprache), Arabisch (sehr gut), Deutsch (C1), '
                  'Englisch (gut), Französisch (Grundkenntnisse)'),
              SizedBox(height: 20),
              Text('Frankfurt, den 06.07.2024', textAlign: TextAlign.right),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _showLebenslauf() {
    const url = 'projektname/Lebenslauf-jdid.pdf';
    if (canLaunch(url) != null) {
      launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}

class Faehigkeiten extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hier sind einige meiner Fähigkeiten, die ich im Laufe der Zeit entwickelt habe.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Image.asset(
            "lib/images/java.png",
            height: 90,
          ),
          SizedBox(height: 20),
          Image.asset(
            "lib/images/saage.jpeg",
            height: 90,
          ),
          SizedBox(height: 20),
          Image.asset(
            "lib/images/Flutter.png",
            height: 90,
          )
        ],
      ),
    );
  }
}

class Kontakt extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sende eine Nachricht',
              style: TextStyle(fontSize: 24),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Dein Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte gib deinen Namen ein';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-Mail'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte gib deine E-Mail ein';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _subjectController,
              decoration: InputDecoration(labelText: 'Betreff'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte gib einen Betreff ein';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Nachricht'),
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte gib eine Nachricht ein';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'amrinouaman@gmail',
                    query:
                        'subject=${Uri.encodeComponent(_subjectController.text)}'
                        '&body=${Uri.encodeComponent('Name: ${_nameController.text}\n\n${_messageController.text}')}\n\n'
                        'E-Mail: ${Uri.encodeComponent(_emailController.text)}',
                  );
                  launch(emailLaunchUri.toString());
                }
              },
              child: Text('Nachricht senden'),
            ),
          ],
        ),
      ),
    );
  }
}
