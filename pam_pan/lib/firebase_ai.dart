import 'dart:io';

import 'package:firebase_vertexai/firebase_vertexai.dart';

class FirebaseAi {
  final model = FirebaseVertexAI.instance
      .generativeModel(model: 'gemini-1.5-flash-preview-0514');

  // important links:
  // https://firebase.google.com/docs/vertex-ai/text-gen-from-multimodal?platform=flutter
  // https://firebase.google.com/docs/vertex-ai/count-tokens?platform=flutter
  // https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types#image

  Future textWithoutStream(String promptText) async {
    //or is it Future<String?>
    final prompt = [Content.text(promptText)];
    final response = await model.generateContent(prompt);
    return response.text;
  }

  Future textWithStream(String promptText) async {
    //or is it Future<String?>
    final prompt = [Content.text(promptText)];
    final response = await model.generateContentStream(prompt);
    await for (final chunk in response) {
      return chunk.text;
    }
  }

  Future oneImageTextWithoutStream(
      String promptText, String imagePath, String imageMime) async {
    //https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types#image
    final prompt = TextPart(promptText);
    final image = await File(imagePath).readAsBytes();
    final imagePart = DataPart(imageMime, image);
    final response = await model.generateContent([
      Content.multi([prompt, imagePart])
    ]);
    return response.text;
  }

  Future oneImageTextWithStream(
      String promptText, String imagePath, String imageMime) async {
    //https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types#image
    final prompt = TextPart(promptText);
    final image = await File(imagePath).readAsBytes();
    final imagePart = DataPart(imageMime, image);
    final response = await model.generateContentStream([
      Content.multi([prompt, imagePart])
    ]);
    await for (final chunk in response) {
      return chunk.text;
    }
  }

  Future twoImagesTextWithoutStream(String promptText, String imagePath1,
      String imageMime1, String imagePath2, String imageMime2) async {
    final (firstImage, secondImage) = await (
      File(imagePath1).readAsBytes(),
      File(imagePath2).readAsBytes()
    ).wait;
    final prompt = TextPart(promptText);
    final imageParts = [
      DataPart(imageMime1, firstImage),
      DataPart(imageMime2, secondImage),
    ];
    final response = await model.generateContent([
      Content.multi([prompt, ...imageParts])
    ]);
    return response.text;
  }

  Future twoImagesTextWithStream(String promptText, String imagePath1,
      String imageMime1, String imagePath2, String imageMime2) async {
    final (firstImage, secondImage) = await (
      File(imagePath1).readAsBytes(),
      File(imagePath2).readAsBytes()
    ).wait;
    final prompt = TextPart(promptText);
    final imageParts = [
      DataPart(imageMime1, firstImage),
      DataPart(imageMime2, secondImage),
    ];
    final response = await model.generateContentStream([
      Content.multi([prompt, ...imageParts])
    ]);
    await for (final chunk in response) {
      return chunk.text;
    }
  }
}
