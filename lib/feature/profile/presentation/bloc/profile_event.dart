class ProfileEvent {}

class ShowProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  UpdateProfileEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class ChangePasswordEvent extends ProfileEvent {
  final String currentPassword;
  final String newPassword;
  final String newConfirmPassword;

  ChangePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
    required this.newConfirmPassword,
  });
}

//class LogoutEvent extends ProfileEvent {}