sealed class LoginEvents {}

class LoginSubmittedEvent extends LoginEvents {
  final String email;
  final String password;

  LoginSubmittedEvent({required this.email, required this.password});
}
