import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:food_recognizer/ui/error_page.dart';
import 'package:food_recognizer/utilities/utils.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:food_recognizer/api/api_text_recognition.dart';
import 'package:food_recognizer/api/api_text_translate.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CameraAwesomeBuilder.awesome(
          imageAnalysisConfig: AnalysisConfig(
              androidOptions: const AndroidAnalysisOptions.nv21(width: 250)),
          saveConfig: SaveConfig.photo(
            pathBuilder: () => path(CaptureMode.photo),
          ),
          enablePhysicalButton: true,
          flashMode: FlashMode.auto,
          aspectRatio: CameraAspectRatios.ratio_16_9,
          previewFit: CameraPreviewFit.fitWidth,
          onMediaTap: (mediaCapture) async {
            final inputImage = InputImage.fromFilePath(mediaCapture.filePath);
            final recognizedText =
                await TextRecognitionApi.recognizeText(inputImage);
            if (recognizedText == null || recognizedText == "") {
              return const ErrorPage();
            }
            final translatedText =
                await TextTranslateApi.translateText(recognizedText);
            if (translatedText == null) {
              return const ErrorPage();
            }
            if (mounted) {
              Navigator.pushNamed(context, '/translate_result',
                  arguments: translatedText);
            }
          },
        ),
      ),
    );
  }
}
