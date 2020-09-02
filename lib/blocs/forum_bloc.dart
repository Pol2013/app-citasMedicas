import 'dart:async';

import 'package:rxdart/rxdart.dart';

class ForumBloc{

  final _questionsController =BehaviorSubject<List<String>>();

  Stream<List<String>> get questionsStream => _questionsController.stream;
  
  Function(List<String>) get changeQuestions => _questionsController.sink.add;

  List<String> get question => _questionsController.value;
  
  dispose() {
    _questionsController?.close();
  }
}