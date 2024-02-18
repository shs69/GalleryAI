import 'package:flutter/material.dart';
import 'package:food_recognizer/ui/camera.dart';
import 'package:food_recognizer/ui/error_page.dart';
import 'package:food_recognizer/ui/result_page.dart';
import 'package:food_recognizer/ui/translate_result.dart';
import 'package:food_recognizer/theme/theme.dart';
import 'package:food_recognizer/ui/gender_recognizer.dart';

Future<void> main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themedata,
      routes: {
        '/': (context) => const HomePage(),
        '/gen': (context) => const GenHeight(),
        '/genres': (context) => const ResultPage(),
        '/translate': (context) => const Camera(),
        '/translate_result': (context) => const TranslateResultPage(),
        '/error': (context) => const ErrorPage(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'AI Gallery',
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
            top: 30.0, left: 50.0, right: 50.0, bottom: 25.0),
        children: [
          Wrap(
            runSpacing: 30.0,
            alignment: WrapAlignment.center,
            children: [
              Image.asset("assets/images/logo_homepage_1.png"),
              const SizedBox(
                height: 15.0,
                width: 100.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gen');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300.0, 100.0),
                  maximumSize: const Size(300.0, 100.0),
                ),
                child: const Text('Gender Recognizer',
                    style: TextStyle(fontSize: 26.0)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/translate');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300.0, 100.0),
                  maximumSize: const Size(300.0, 100.0),
                ),
                child: const Text('AI Translate',
                    style: TextStyle(fontSize: 26.0)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
