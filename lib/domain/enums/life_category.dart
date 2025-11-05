/// Life categories enum
enum LifeCategory {
  work,
  fitness,
  social,
  rest,
  growth,
  hobbies;

  String get displayName {
    switch (this) {
      case LifeCategory.work:
        return 'Work';
      case LifeCategory.fitness:
        return 'Fitness';
      case LifeCategory.social:
        return 'Social';
      case LifeCategory.rest:
        return 'Rest';
      case LifeCategory.growth:
        return 'Personal Growth';
      case LifeCategory.hobbies:
        return 'Hobbies';
    }
  }

  static LifeCategory fromString(String value) {
    return LifeCategory.values.firstWhere(
      (e) => e.name == value.toLowerCase(),
      orElse: () => LifeCategory.work,
    );
  }
}
