import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';

class GetSingleUserCase{
  final FirebaseRepository repository;


  GetSingleUserCase({required this.repository});

  Stream<List<UserEntity>> call(String uid){
    return repository.getSingleUser( uid);
  }

}