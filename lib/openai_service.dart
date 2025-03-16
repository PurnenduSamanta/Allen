import 'dart:convert';

import 'package:allen/secret.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  Future<String> isARTPromptAPI(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
                  'Does this message want to generate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no.',
            },
          ],
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
      return '';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    return '';
  }

  Future<String> dallEAPI(String prompt) async {
    return '';
  }
}
