class ForgetPasswordBody {
  final String email;

  ForgetPasswordBody({required this.email});

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}
