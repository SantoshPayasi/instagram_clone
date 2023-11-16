import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';

class GetCurrentUidUseCase{
  final FirebaseRepository repository;


  GetCurrentUidUseCase({required this.repository});

  Future<String> call(UserEntity user){
    return repository.getCurrentUid();
  }

}