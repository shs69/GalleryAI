import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class TextRecognitionApi {
  static Future<String?> recognizeText(InputImage inputImage) async {
    try {
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);
      textRecognizer.close();
      return recognizedText.text;
    } catch (e) {
      return null;
    }
  }
}
