import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';

import '../../../domain/usecases/firebase_usecases/user/signin_user_usecase.dart';
import '../../../domain/usecases/firebase_usecases/user/signup_usecase.dart';

part 'cridential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUserUseCase signInUserUseCase;
  final SignUpUseCase signUpUseCase;
  CredentialCubit({required this.signUpUseCase, required this.signInUserUseCase}) : super(CredentialInitial());

  Future<void>signInUser(String email, String password) async{
      emit(CredentialLoading());
      try{
        await signInUserUseCase.call(UserEntity(email: email, passwords: password));
        emit(CredentialSuccess());
      }on SocketException catch(_){
        emit(CredentialFailure());
      }catch(_){
        emit(CredentialFailure());
      }
  }
  Future<void>signUpUser(UserEntity user) async{
      emit(CredentialLoading());
      try{
        await signUpUseCase.call(user);
        emit(CredentialSuccess());
      }on SocketException catch(_){
        emit(CredentialFailure());
      }catch(_){
        emit(CredentialFailure());
      }
  }
}
