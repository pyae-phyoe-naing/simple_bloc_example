import 'dart:async';

class CalculateBloc {

  final StreamController<int> _calculateController = StreamController<int>();
  Stream<int> getCalculateStream() => _calculateController.stream;

  final StreamController<String> _methodController  = StreamController<String>();
  Stream<String> getMethodStream() => _methodController.stream;

  add(int numOne, int numTwo) {
    int total = numOne + numTwo;
    _calculateController.sink.add(total);
    _methodController.sink.add('ပေါင်းတာ');
  }

  sub(int numOne, int numTwo) {
    int total = numOne - numTwo;
    _calculateController.sink.add(total);
    _methodController.sink.add('နှုတ်တာ');

  }

  dispose() {
    _calculateController.close();
  }
}
