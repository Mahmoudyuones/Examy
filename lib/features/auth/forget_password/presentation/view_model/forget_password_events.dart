sealed class ForgetPasswordEvent {}

class ForgetPasswordEmailChanged extends ForgetPasswordEvent {
  final String email;

  ForgetPasswordEmailChanged({required this.email});
}
