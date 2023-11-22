import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';

class CreateUserWithProfilePic {
  final FirebaseRepository repository;

  CreateUserWithProfilePic({required this.repository});

  Future<void> call(UserEntity user, String imageUrl) async {
    return repository.createUserWithProfile(user, imageUrl);
  }
}
