import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_tracker/domain/enums/subscription_tier.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String email,
    String? displayName,
    String? photoUrl,
    @Default(SubscriptionTier.free) SubscriptionTier subscriptionTier,
    DateTime? subscriptionExpiresAt,
    @Default([]) List<String> preferredCategories,
    required DateTime createdAt,
    DateTime? lastSyncAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

extension UserProfileExtension on UserProfile {
  bool get isPremium => subscriptionTier.isPremium;

  bool get isSubscriptionActive {
    if (!isPremium) return false;
    if (subscriptionExpiresAt == null) return true; // Lifetime
    return DateTime.now().isBefore(subscriptionExpiresAt!);
  }
}
