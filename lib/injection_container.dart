// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:instagram_clone/features/data/data_sources/RemoteDataSource/remote_data_source.dart';
import 'package:instagram_clone/features/data/data_sources/RemoteDataSource/remote_data_source_impl.dart';
import 'package:instagram_clone/features/data/repository/firebase_repository_impl.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/uploadImage_useCase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/create_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/ger_all_users_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/get_current_uid_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/get_single_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/is_sign_in_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/signin_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/signout_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/signup_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/update_user_usecase.dart';
import 'package:instagram_clone/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/cridentials/cridential_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/user/getSIngleUser/cubit/get_single_user_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/user/user_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //  Cubits
  sl.registerFactory(() => AuthCubit(
      isSignInUseCase: sl.call(),
      getCurrentUidUseCase: sl.call(),
      signOutUseCase: sl.call()));

  sl.registerFactory(() =>
      CredentialCubit(signUpUseCase: sl.call(), signInUserUseCase: sl.call()));

  sl.registerFactory(
      () => UserCubit(getUserUseCase: sl.call(), updateUserUseCase: sl.call()));

  sl.registerFactory(() => GetSingleUserCubit(getSingleUserCase: sl.call()));

  // UseCases
  sl.registerLazySingleton(() => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignInUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => CreateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetAllUsersUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetSingleUserCase(repository: sl.call()));

// Cloud Storage
  sl.registerLazySingleton(() => UploadImageUseCase(repository: sl.call()));
  // Repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  // Remote data source
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(
          firebaseFirestore: sl.call(),
          firebaseAuth: sl.call(),
          firebaseStorage: sl.call()));

  // Externals
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => firebaseStorage);
}
