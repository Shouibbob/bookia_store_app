class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadedState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {}

// Update Profile
class UpdateProfileLoadingState extends ProfileState {}

class UpdateProfileSuccessState extends ProfileState {}

// Change Password

class ChangePasswordLoadingState extends ProfileState {}

class ChangePasswordSuccessState extends ProfileState {}


// Logout
// class LogoutLoadingState extends ProfileState {}

// class LogoutSuccessState extends ProfileState {}

// class LogoutErrorState extends ProfileState {
//   final String error;
//   LogoutErrorState(this.error);
// }

