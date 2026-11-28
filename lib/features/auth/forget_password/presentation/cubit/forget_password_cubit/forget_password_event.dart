sealed class ForgetPasswordEvent {}

class SendEmail extends ForgetPasswordEvent {
  final String email;

  SendEmail({required this.email});
}
