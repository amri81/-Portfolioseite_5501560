import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
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
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
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
      child: ElevatedButton(
        onPressed: () {
          launch(
              'projektname/Lebenslauf-jdid.pdf'); // Hier den Pfad zur PDF-Datei anpassen
        },
        child: Text('Lebenslauf anzeigen'),
      ),
    );
  }
}

class Faehigkeiten extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Hier sind einige meiner Fähigkeiten, die ich im Laufe der Zeit entwickelt habe.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 90), // Add some spacing between text and image
          Image.asset(
            "lib/images/java.png",
            height: 90,
          ),
          SizedBox(height: 90), // Add some spacing between the images
          Image.asset(
            "lib/images/saage.jpeg",
            height: 90,
          ),
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
                    path: 'amrinouaman@gmail.com',
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