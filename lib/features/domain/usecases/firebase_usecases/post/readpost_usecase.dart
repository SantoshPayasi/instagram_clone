import 'package:instagram_clone/features/domain/entities/posts/post_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';

class UpdatePostUsecase {
  final FirebaseRepository repository;

  UpdatePostUsecase(this.repository);
  Stream<List<PostEntity>> call(PostEntity post) {
    return repository.readPosts(post);
  }
}