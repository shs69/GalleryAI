import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_recognizer/reps/models/neural_api_gen.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {
  List<NeuralApiGender>? chanceList;
  double? chance;
  String? gen;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(
      args != null && args is List<NeuralApiGender>,
      'You must provide List<NeuralApiGender> args',
    );
    chanceList = args as List<NeuralApiGender>;
    final chanceMale = double.parse(chanceList![0].chance) * 100;
    final chanceFemale = (1 - double.parse(chanceList![0].chance)) * 100;
    debugPrint(chanceFemale.toString());
    debugPrint(chanceMale.toString());
    if (chanceMale > chanceFemale) {
      chance = chanceMale;
      gen = 'мужчина';
    } else {
      chance = chanceFemale;
      gen = 'женщина';
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade500.withAlpha(130),
      appBar: AppBar(
        title: Text(
          'Gender Recognizer',
          style: theme.appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade400.withAlpha(255),
        foregroundColor: Colors.white70,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 200.0, left: 50.0, right: 50.0),
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.deepPurpleAccent,
            ),
            child: (chanceList == null || gen == null || chance == null)
                ? const Center(
                    child: AutoSizeText(
                      'Ошибка, пожалуйста вернитесь на предыдущую страницу',
                    ),
                  )
                : Center(
                    child: AutoSizeText(
                      'С вероятностью ${chance!.toInt()}% \nвы - $gen',
                      style: TextStyle(
                        color: Colors.white.withAlpha(190),
                        fontSize: 26,
                      ),
                      maxLines: 2,
                    ),
                  ),
          ),
          const SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(70.0, 70.0),
                  maximumSize: const Size(70.0, 70.0),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.home_outlined,
                      size: 40.0,
                    ),
                    Text('Домой'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
