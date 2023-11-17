import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/usecases/firebase_usecases/user/get_current_uid_usecase.dart';
import '../../../domain/usecases/firebase_usecases/user/is_sign_in_usecase.dart';
import '../../../domain/usecases/firebase_usecases/user/signout_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  SignOutUseCase signOutUseCase;
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  AuthCubit({required this.isSignInUseCase, required this.getCurrentUidUseCase, required this.signOutUseCase}) : super(AuthInitial());

  Future<void> appStarted(BuildContext context) async{
    try{
      bool isSignIn = await isSignInUseCase.call();
      if(isSignIn==true){
        final String uid = await getCurrentUidUseCase.call();
        emit(Authenticated(uid: uid));
      }
      else{
        emit(UnAuthenticated());
      }
    }
   catch(_){
    emit(UnAuthenticated());
  }
 }
  Future<void> loggedIn() async {
    try{
      final uid = await getCurrentUidUseCase.call();
      emit(Authenticated(uid: uid));
    }
    catch(_){
      emit(UnAuthenticated());
    }
  }


  Future<void> loggedOut() async{
    try{
      await signOutUseCase.call();
      emit(UnAuthenticated());
    }catch(_){
      emit(UnAuthenticated());
    }

  }
}



