import 'dart:io';
import 'dart:math';

void main() {
  // final words = _parseMongolianRawText();
  // final words = _parseFullWordsNoHyphensMongolian(geminiMongolian);
  // final words = _parseFullWordsNoHyphensEnglish(geminiInputEnglish);
  // final words = _parseMongolianArticles();
  final words = _parseMongolianTranslations();
  // print(words);
  print(words.length);
  _print100RandomWords(words);
  final outputFile = File('output.txt');
  outputFile.writeAsStringSync(words.join('\n'));
}

void _print100RandomWords(List<String> words) {
  final random = Random();
  final shuffledWords = words.toList()..shuffle(random);
  print(shuffledWords.take(100).join(', '));
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
