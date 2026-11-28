sealed class ResetCodeEvent {}

class EmailVerification extends ResetCodeEvent {
  final String code;

  EmailVerification({required this.code});
}

class ResendCode extends ResetCodeEvent {
  final String email;

  ResendCode({required this.email});
}
