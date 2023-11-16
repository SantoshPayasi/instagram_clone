import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';

class IsSignInUseCase{
  final FirebaseRepository repository;


  IsSignInUseCase({required this.repository});

  Future<bool> call(UserEntity user){
    return repository.isSignIn();
  }

}