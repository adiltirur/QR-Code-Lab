import 'dart:ui';

enum Language {
  english(
    id: 1,
    locale: Locale.fromSubtags(languageCode: 'en'),
  ),
  german(
    id: 2,
    locale: Locale.fromSubtags(languageCode: 'de'),
  );

  final int id;
  final Locale locale;

  const Language({
    required this.id,
    required this.locale,
  });

  factory Language.fromId(int id) {
    const languages = Language.values;
    return languages.firstWhere((e) => e.id == id);
  }

  factory Language.fromLanguageCode(String languageCode) {
    const languages = Language.values;
    return languages.firstWhere((e) => e.locale.languageCode == languageCode);
  }
}
