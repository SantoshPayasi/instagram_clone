import 'package:instagram_clone/features/domain/entities/posts/post_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';

class UpDatePostUseCase {
  final FirebaseRepository repository;

  UpDatePostUseCase(this.repository);
  Future<void> call(PostEntity post) {
    return repository.updatePost(post);
  }
}