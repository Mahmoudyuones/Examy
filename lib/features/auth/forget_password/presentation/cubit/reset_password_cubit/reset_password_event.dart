sealed class ResetPasswordEvent {}

class ResetPassword extends ResetPasswordEvent {
  final String email;
  final String newPassword;

  ResetPassword({required this.email, required this.newPassword});
}
