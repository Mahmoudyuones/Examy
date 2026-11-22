class ResetPasswordBody {
  final String email;
  final String newPassword;

  ResetPasswordBody({required this.email, required this.newPassword});

  Map<String, dynamic> toJson() {
    return {'email': email, 'newPassword': newPassword};
  }
}
