class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final bool rememberMe;
  final String? errMsg;

  const LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.rememberMe = false,
    this.errMsg,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? rememberMe,
    String? errMsg,
    bool clearErrMsg = false,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      rememberMe: rememberMe ?? this.rememberMe,
      errMsg: clearErrMsg ? null : (errMsg ?? this.errMsg),
    );
  }

  @override
  String toString() =>
      'LoginState(isLoading: $isLoading, isSuccess: $isSuccess, '
      'rememberMe: $rememberMe, errMsg: $errMsg)';
}
