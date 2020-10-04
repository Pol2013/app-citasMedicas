import 'dart:convert';

import 'package:app_citas/models/frequentquestion_model.dart';
import 'package:http/http.dart' as http;

class FrequentQuestionProvider {
  Future<List<FrequentquestionModel>> getFrequentQuestions() async {
    final response =
        await http.get('http://10.0.2.2:8000/api/frequentquestion');

    final List<dynamic> decodedData = json.decode(response.body);
    print(decodedData);
    final frequentQuestions = List<FrequentquestionModel>();

    if (decodedData == null) return [];

    decodedData.forEach((element) {
      frequentQuestions.add(FrequentquestionModel.fromJson(element));
    });

    print(frequentQuestions);
    return frequentQuestions;
  }
}
