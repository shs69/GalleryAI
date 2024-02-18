import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";

class TranslateResultPage extends StatefulWidget {
  const TranslateResultPage({
    super.key,
  });

  @override
  State<TranslateResultPage> createState() => _TranslateResultPageState();
}

class _TranslateResultPageState extends State<TranslateResultPage> {
  @override
  Widget build(BuildContext context) {
    final recText = ModalRoute.of(context)?.settings.arguments;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Translate',
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.deepPurpleAccent),
            child: AutoSizeText(recText.toString(),
                style: theme.textTheme.displayMedium),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(70.0, 70.0),
              maximumSize: const Size(70.0, 70.0),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home_outlined, size: 40.0),
                SizedBox(width: 5),
                Text('Домой'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
