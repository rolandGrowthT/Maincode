part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String email;
  final String password;
  final String alertmessage;
  const LoginState({
    this.loginStatus = LoginStatus.none,
    this.email = '',
    this.password = '',
    this.alertmessage = '',
  });
  List<Object?> get props => [loginStatus, email, password, alertmessage];
  LoginState copyWith({
    LoginStatus? loginStatus,
    String? email,
    String? password,
    String? alertmessage,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      alertmessage: alertmessage ?? this.alertmessage,
    );
  }
}
