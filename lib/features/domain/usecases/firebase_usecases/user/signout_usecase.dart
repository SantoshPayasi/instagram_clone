import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';

class SignOut{
  final FirebaseRepository repository;


  SignOut({required this.repository});

  Future<void> call(UserEntity user){
    return repository.signOut();
  }

}