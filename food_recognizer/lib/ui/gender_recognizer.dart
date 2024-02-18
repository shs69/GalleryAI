import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_recognizer/reps/models/neural_api_gen.dart';
import '../api/api_guess_gender.dart';

class GenHeight extends StatefulWidget {
  const GenHeight({super.key});

  @override
  State<GenHeight> createState() => _GenHeight();
}

class _GenHeight extends State<GenHeight> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gender Recognizer',
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.only(top: 30.0, left: 50.0, right: 50.0),
          children: [
            Image.asset("assets/images/logo_genheight.png", height: 220.0),
            const SizedBox(
              height: 25.0,
              width: 100.0,
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: _heightController,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: 'Рост, см',
                labelStyle: theme.inputDecorationTheme.labelStyle,
                hintText: 'Введите рост',
                hintStyle: theme.inputDecorationTheme.hintStyle,
                prefixIcon: const Icon(Icons.height),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(
                    color: Colors.deepPurple,
                    width: 3,
                  ),
                ),
                prefixIconColor: Colors.white.withAlpha(190),
                prefixIconConstraints: const BoxConstraints(minWidth: 40),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: Colors.deepPurple.shade200.withAlpha(200),
                    width: 3,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              maxLength: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Поле не должно быть пустым';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              textInputAction: TextInputAction.done,
              controller: _weightController,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: 'Вес, кг',
                labelStyle: theme.inputDecorationTheme.labelStyle,
                hintText: 'Введите ваш вес',
                hintStyle: theme.inputDecorationTheme.hintStyle,
                prefixIcon: const Icon(Icons.height),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(
                    color: Colors.deepPurple,
                    width: 3,
                  ),
                ),
                prefixIconColor: Colors.white.withAlpha(190),
                prefixIconConstraints: const BoxConstraints(minWidth: 40),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: Colors.deepPurple.shade200.withAlpha(200),
                    width: 3,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              maxLength: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Поле не должно быть пустым';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate() && mounted) {
                  final weight = _weightController.text;
                  final height = _heightController.text;
                  List<NeuralApiGender> chanceList =
                      await NeuralApiRep().getGender(weight, height);
                  if (context.mounted) {
                    Navigator.pushNamed(context, '/genres',
                        arguments: chanceList);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50.0),
                maximumSize: const Size.fromHeight(50.0),
              ),
              child: const Text(
                'Узнать пол',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
