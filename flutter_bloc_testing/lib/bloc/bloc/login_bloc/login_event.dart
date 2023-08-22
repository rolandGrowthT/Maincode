part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {
  const LoginEvent();
  List<Object> get props => [];
}

class onemailchanged extends LoginEvent {
  final String email;
  const onemailchanged(
    this.email,
  );
  List<Object> get props => [email];
}

class onpasswordchanged extends LoginEvent {
  final String password;
  const onpasswordchanged(
    this.password,
  );
  List<Object> get props => [password];
}

class onlogin extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;
  const onlogin(
    this.email,
    this.password,
    this.context,
  );
  List<Object> get props => [email, password, context];
}

class onclearlogin extends LoginEvent {
  const onclearlogin();
  List<Object> get props => [];
}

// class showerror extends LoginEvent {
//   final BuildContext context;
//   final String message;
//   const showerror(
//     this.context,
//     this.message,
//   );
//   List<Object> get props => [context,message];
// }
