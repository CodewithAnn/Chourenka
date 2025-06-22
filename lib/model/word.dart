class Word {
  /// [topic] topic/theme of the word
  final String topic;

  /// [english] word
  final String english;

  /// [character] in the language here is chinese
  final String character;

  /// [pinyin] Roman word system to pronounce a word in chinese
  final String pinyin;

  Word({required this.topic, required this.english, required this.character, required this.pinyin});
}
