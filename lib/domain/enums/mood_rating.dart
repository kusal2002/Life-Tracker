/// Mood rating scale (1-5)
enum MoodRating {
  veryBad(1, 'Very Bad', '😢'),
  bad(2, 'Bad', '😕'),
  neutral(3, 'Neutral', '😐'),
  good(4, 'Good', '😊'),
  excellent(5, 'Excellent', '😄');

  final int value;
  final String label;
  final String emoji;

  const MoodRating(this.value, this.label, this.emoji);

  static MoodRating fromValue(int value) {
    return MoodRating.values.firstWhere(
      (e) => e.value == value,
      orElse: () => MoodRating.neutral,
    );
  }
}
