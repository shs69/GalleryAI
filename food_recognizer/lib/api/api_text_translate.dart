import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TextTranslateApi {
  static Future<String?> translateText(String recognizedText) async {
    try {
      final lang = LanguageIdentifier(confidenceThreshold: 0.5);
      final langCode = await lang.identifyLanguage(recognizedText);
      lang.close();
      final translator = OnDeviceTranslator(
          sourceLanguage: TranslateLanguage.values
              .firstWhere((element) => element.bcpCode == langCode),
          targetLanguage: TranslateLanguage.russian);
      final translatedText = await translator.translateText(recognizedText);
      translator.close();
      return translatedText;
    } catch (e) {
      return null;
    }
  }
}
