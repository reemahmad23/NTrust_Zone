
import 'package:home/features/home/domain/entities/user_profile.dart';
import 'package:home/features/home/domain/repos/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepo repo;

  GetProfileUseCase(this.repo);

  Future<UserProfile> call() async {
    return await repo.getProfile();
  }
}
