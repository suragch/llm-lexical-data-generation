import 'dart:io';
import 'dart:math';

void main() {
  // final words = _parseMongolianDirect();
  // final words = _parseMongolianArticles();
  final words = _parseMongolianTranslations();
  // print(words);
  print(words.length);
  final outputFile = File('output.txt');
  outputFile.writeAsStringSync(words.join('\n'));

  final randomWords = _randomWords(words, 1000);
  final randomOutputFile = File('random.txt');
  randomOutputFile.writeAsStringSync(randomWords.join('\n'));
}

List<String> _randomWords(List<String> words, int number) {
  final random = Random();
  final shuffledWords = words.toList()..shuffle(random);
  return shuffledWords.take(number).toList();
}

List<String> _parseFullWordsNoHyphensEnglish(String input) {
  final RegExp wordRegex = RegExp(r'[a-zA-Z-]+');
  final matches = wordRegex.allMatches(input.toLowerCase());
  return matches
      .map((match) => match.group(0)!)
      .where((word) => !word.contains('-') && word.isNotEmpty)
      .toSet()
      .toList()
    ..sort();
}

List<String> _parseFullWordsNoHyphensMongolian(String input) {
  final RegExp wordRegex = RegExp(r'[а-яА-ЯөӨүҮёЁ]+');
  final matches = wordRegex.allMatches(input.toLowerCase());
  return matches
      .map((match) => match.group(0)!)
      .where((word) => !word.contains('-') && word.isNotEmpty)
      .toSet()
      .toList()
    ..sort();
}

List<String> _parseMongolianDirect() {
  final file = File('../data/direct/mn/gemini_cleaned_output.txt');
  final input = file.readAsStringSync();
  return _parseFullWordsNoHyphensMongolian(input);
}

List<String> _parseMongolianArticles() {
  final Set<String> allWords = {};
  for (int i = 1; i <= 100; i++) {
    final fileName = i.toString().padLeft(2, '0');
    final file = File('../data/topics/articles/$fileName');
    if (!file.existsSync()) continue;
    // print(file.path);

    final input = file.readAsStringSync();
    final RegExp wordRegex = RegExp(r'[а-яА-ЯөӨүҮёЁ]+');
    final matches = wordRegex.allMatches(input.toLowerCase());
    final words = matches.map((match) => match.group(0)!);
    final oldLength = allWords.length;
    allWords.addAll(words);
    print('Article $i: ${words.length} words, new: ${allWords.length - oldLength}, total: ${allWords.length}');
  }
  return allWords.toList()..sort();
}

List<String> _parseMongolianTranslations() {
  final file = File('../data/translate/output/translated.txt');
  final input = file.readAsStringSync();
  return _parseFullWordsNoHyphensMongolian(input);
}
