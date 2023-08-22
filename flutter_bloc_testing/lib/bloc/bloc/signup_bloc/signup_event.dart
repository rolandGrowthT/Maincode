part of 'signup_bloc.dart';

@immutable
class SignUpEvent extends Equatable {
  const SignUpEvent();
  List<Object> get props => [];
}

class onfnamechanged extends SignUpEvent {
  final String firstname;
  const onfnamechanged(
    this.firstname,
  );
  List<Object> get props => [firstname];
}

class onlnamechanged extends SignUpEvent {
  final String lastname;
  const onlnamechanged(
    this.lastname,
  );
  List<Object> get props => [lastname];
}

class onemailchanged extends SignUpEvent {
  final String email;
  const onemailchanged(
    this.email,
  );
  List<Object> get props => [email];
}

class onpasswordchanged extends SignUpEvent {
  final String password;
  const onpasswordchanged(
    this.password,
  );
  List<Object> get props => [password];
}

class onsignup extends SignUpEvent {
  final String email;
  final String password;
  final String fname;
  final String lname;
  final BuildContext context;
  const onsignup(
    this.email,
    this.password,
    this.fname,
    this.lname,
    this.context,
  );
  List<Object> get props => [email, password, fname, lname,context];
}
class onclearsignup extends SignUpEvent {
  const onclearsignup();
  List<Object> get props => [];
}


