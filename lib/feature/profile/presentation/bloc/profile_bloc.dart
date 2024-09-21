import 'dart:developer';

import 'package:bookia_store_app/feature/profile/data/models/response/profile_response_model/profile_response_model.dart';
import 'package:bookia_store_app/feature/profile/data/repo/profile_repo.dart';
import 'package:bookia_store_app/feature/profile/presentation/bloc/profile_event.dart';
import 'package:bookia_store_app/feature/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ShowProfileEvent>(getProfileData);
    //on<LogoutEvent>(logOut);
    on<UpdateProfileEvent>(updateProfileData);
    on<ChangePasswordEvent>(changePassword);
  }

  ProfileResponseModel? profileResponseModel;

  Future<void> getProfileData(
      ShowProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    try {
      await ProfileRepo.getProfileData().then((value) {
        if (value != null) {
          profileResponseModel = value;
          emit(ProfileLoadedState());
        } else {
          emit(ProfileErrorState());
        }
      });
    } catch (e) {
      log('error ${e.toString()}');
      emit(ProfileErrorState());
    }
  }

  Future<void> updateProfileData(
      UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(UpdateProfileLoadingState());
    try {
      await ProfileRepo.updateProfileData(
        name: event.name,
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
      ).then((value) {
        if (value != null) {
          emit(UpdateProfileSuccessState());
        } else {
          emit(ProfileErrorState());
        }
      });
    } catch (e) {
      log('error update ${e.toString()}');
      emit(ProfileErrorState());
    }
  }

  Future<void> changePassword(
      ChangePasswordEvent event, Emitter<ProfileState> emit) async {
    emit(ChangePasswordLoadingState());
    try {
      await ProfileRepo.changePassword(
        currentPassword: event.currentPassword,
        newPassword: event.newPassword,
        newConfirmPassword: event.newConfirmPassword,
      ).then((value) {
        if (value != null) {
          emit(ChangePasswordSuccessState());
        } else {
          emit(ProfileErrorState());
        }
      });
    } catch (e) {
      log('error change password bloc ${e.toString()}');
      emit(ProfileErrorState());
    }
  }

  // Future<void> logOut(LogoutEvent event, Emitter<ProfileState> emit) async {
  //   emit(LogoutLoadingState());
  //   try {
  //     await ProfileRepo.logOut().then((value) {
  //       if (value) {
  //         emit(LogoutSuccessState());
  //       } else {
  //         emit(LogoutErrorState('Somthing Error Occured'));
  //       }
  //     });
  //   } catch (e) {
  //     log(e.toString());
  //     emit(LogoutErrorState('Something went wrong'));
  //   }
  // }
}
