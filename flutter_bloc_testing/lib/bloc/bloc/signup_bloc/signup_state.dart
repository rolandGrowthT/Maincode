part of 'signup_bloc.dart';

@immutable
class SignUpState extends Equatable {
  final SignupStatus signupStatus;
  final String fname;
  final String lname;
  final String email;
  final String password;
  final String alertmessage;
  final CurrentUserModel cuser;

  const SignUpState({
    this.signupStatus = SignupStatus.none,
    this.fname = '',
    this.lname = '',
    this.email = '',
    this.password = '',
    this.alertmessage='',
    this.cuser = const CurrentUserModel(id: '', firstName: '', lastName: ''),
  });
  @override
  List<Object?> get props => [signupStatus,fname,lname,email,password,alertmessage];
  SignUpState copyWith({
    SignupStatus? signupStatus,
    String? fname,
    String? lname,
    String? email,
    String? password,
    String? alertmessage,
    CurrentUserModel? cuser,
  }) {
    return SignUpState(
      signupStatus: signupStatus ?? this.signupStatus,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      email: email ?? this.email,
      password: password ?? this.password,
      alertmessage: alertmessage ?? this.alertmessage,
      cuser: cuser ?? this.cuser,
    );
  }
}
