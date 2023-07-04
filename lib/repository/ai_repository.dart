import 'dart:convert';

import 'package:http/http.dart';

class AiRepository {
  static Future<String> sendRequest(
      {required String aiText, required String locale}) async {
    try {
      // String tok = 'Bearer ${dotenv.env['token']}';
      String tok = 'Bearer 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';
      String request = locale == 'en'
          ? "Create a recipe from a list of ingredients $aiText"
          : "Создай рецепт из списка ингредиентов $aiText";
      Response response = await post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Authorization': tok,
          "content-type": "application/json",
          'Access-Control-Allow-Origin': '*',
          "Accept": "application/json",
          "Access-Control-Allow-Credentials":
              'true', // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
        body: jsonEncode({
          'model': 'text-davinci-003',
          'prompt': request,
          'max_tokens': 1000,
          'temperature': 0,
          'top_p': 1
        }),
      );

      if (response.statusCode == 200) {
        var res = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
        return res['choices'][0]['text'];
      } else {
        return response.body;
      }
    } catch (e) {
      print(e);
      return 'Error occured, try again! $e';
    }
  }
}
