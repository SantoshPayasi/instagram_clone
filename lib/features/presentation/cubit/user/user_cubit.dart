import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user/user_entity.dart';
import '../../../domain/usecases/firebase_usecases/user/update_user_usecase.dart';
import '../../../domain/usecases/firebase_usecases/user/ger_all_users_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UpdateUserUseCase updateUserUseCase;
  final GetAllUsersUseCase getUserUseCase;
  UserCubit({required this.getUserUseCase, required this.updateUserUseCase}) : super(UserInitial());

  Future<void>getUsers(UserEntity user) async{
    emit(UserLoading());
    try{
      final streamResponse = getUserUseCase.call(user);
      streamResponse.listen((users) {
        emit(UserLoaded(users: users));
      });
    }on SocketException catch(_){
      emit(UserFailure());
    } catch(_){
      emit(UserFailure());
    }
  }

  Future<void>updateUser(UserEntity user) async{
    try{
      await updateUserUseCase.call(user);
    }on SocketException catch(_){
      emit(UserFailure());
    }catch(_){
      emit(UserFailure());
    }

  }
}
