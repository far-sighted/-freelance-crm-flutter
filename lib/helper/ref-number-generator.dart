import 'dart:math';

class NumberGenerator {
  late String generatedValue;

  NumberGenerator(String code, String id) {
    generatedValue =
        "$code$id${_generateRandomNumber()}${_generateCheckDigit(id)}";
  }

  int _generateRandomNumber() => Random().nextInt(90000) + 10000;

  int _generateCheckDigit(String uid) =>
      uid.split('').map(int.parse).fold(0, (sum, digit) => sum + digit) % 11;

  String get getGeneratedValue => generatedValue;
}
