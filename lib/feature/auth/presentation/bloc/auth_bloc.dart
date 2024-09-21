import 'dart:developer';

import 'package:bookia_store_app/core/services/local_storage.dart';
import 'package:bookia_store_app/feature/auth/data/repo/auth_repo_dio.dart';
import 'package:bookia_store_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_store_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
    on<SendForgetPasswordEvent>(sendForgetPassword);
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    // handle api call
    try {
      await AuthRepo.register(event.params).then((value) {
        if (value != null) {
          // cache token
          AppLocalStorage.cacheData(
            key: AppLocalStorage.token,
            value: value.data?.token,
          );
          emit(RegisterSuccessState());
        } else {
          emit(RegisterErrorState('Somthing Error Occured'));
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
          // cache token
          AppLocalStorage.cacheData(
            key: AppLocalStorage.token,
            value: value.data?.token,
          );
          emit(LoginSuccessState());
        } else {
          emit(LoginErrorState('Somthing Error Occured'));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(LoginErrorState('Something went wrong'));
    }
  }

  Future<void> sendForgetPassword(
      SendForgetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(SendForgetPasswordLoadingState());
    // handle api call
    try {
      await AuthRepo.sendForgetPassword(email: event.email).then((value) {
        if (value != null) {
          emit(SendForgetPasswordSuccessState());
        } else {
          emit(SendForgetPasswordErrorState('Somthing Error Occured'));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(SendForgetPasswordErrorState('Something went wrong'));
    }
  }
}
