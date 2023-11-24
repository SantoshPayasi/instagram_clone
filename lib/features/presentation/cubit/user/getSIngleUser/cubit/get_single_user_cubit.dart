import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/get_single_user_usecase.dart';
part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserCase getSingleUserCase;

  GetSingleUserCubit({required this.getSingleUserCase})
      : super(GetSingleUserInitial());

  Future<void> getSingleuser(String uid) async {
    emit(SIngleUserLoading());
    if (kDebugMode) {
      print(uid);
    }
    try {
      final streamresponse = getSingleUserCase.call(uid);
      streamresponse.listen((user) {
        emit(SingleUserLoaded(user: user.first));
      });
    } on SocketException {
      emit(SIngleUserFailure());
    } catch (e) {
      if (kDebugMode) {
        print("Beta error aa gai ruk ja");
      }
      emit(SIngleUserFailure());
    }
  }
}
