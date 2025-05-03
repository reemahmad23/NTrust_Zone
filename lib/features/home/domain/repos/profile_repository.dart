import 'package:home/features/home/domain/entities/update_profile_entity.dart';
import 'package:home/features/home/domain/entities/user_profile.dart';

abstract class ProfileRepo {
  Future<UserProfile> getProfile();
  Future<void> updateProfile(UpdateProfileEntity entity);
}
