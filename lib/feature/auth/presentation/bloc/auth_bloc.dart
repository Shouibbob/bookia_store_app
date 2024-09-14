import 'dart:developer';

import 'package:bookia_store_app/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia_store_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_store_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    // handle api call
    try {
      await AuthRepo.register(event.params).then((value) {
        if (value != null) {
          emit(RegisterSuccessState());
        } else {
          emit(RegisterErrorState('Somthing Error'));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(RegisterErrorState('Somthing went wrong'));
    }
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    // handle api call
    try {
      await AuthRepo.login(event.params).then((value) {
        if (value != null) {
          emit(LoginSuccessState());
        } else {
          emit(LoginErrorState('Somthing Error'));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(LoginErrorState('Something went wrong'));
    }
  }
}
