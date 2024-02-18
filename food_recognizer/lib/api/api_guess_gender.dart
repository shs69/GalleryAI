import 'package:dio/dio.dart';
import 'package:food_recognizer/reps/models/neural_api_gen.dart';

class NeuralApiRep {
  Future<List<NeuralApiGender>> getGender(String weight, String height) async {
    final response = await Dio().get('http://10.0.2.2:8000/$weight/$height');

    final data = response.data as Map<String, dynamic>;
    final chanceList = data.entries
        .map(
          (e) => NeuralApiGender(
            name: e.key,
            chance: e.value as String,
          ),
        )
        .toList();
    return chanceList;
  }
}
