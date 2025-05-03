import 'package:home/features/home/domain/entities/update_profile_entity.dart';
import 'package:home/features/home/domain/repos/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepo repo;

  UpdateProfileUseCase(this.repo);

  Future<void> call(UpdateProfileEntity entity) async {
    return await repo.updateProfile(entity);
  }
}
