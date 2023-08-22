import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_testing/data/enum/Login.dart';
import 'package:flutter_bloc_testing/data/repository/Authentication_Services.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<onemailchanged>(_onemailchanged);
    on<onclearlogin>(_onclearlogin);
    // on<showerror>(_showerror);

    on<onpasswordchanged>(_onpasswordchanged);
    on<onlogin>(_onlogin);
  }
  void _onemailchanged(onemailchanged event, Emitter<LoginState> emit) {
    final email = event.email;
    emit(state.copyWith(email: email));
  }

  void _onpasswordchanged(onpasswordchanged event, Emitter<LoginState> emit) {
    final password = event.password;
    emit(state.copyWith(password: password));
  }

  void _onlogin(onlogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    final email = event.email;
    final password = event.password;
    final BuildContext context = event.context;

    String alertremessage = await signIn(
      context,
      email,
      password,
    );
    emit(state.copyWith(loginStatus: LoginStatus.none));

    if (alertremessage == '') {
      emit(state.copyWith(alertmessage: alertremessage));
      LoginStatus.successfullogin;
    } else {
      emit(state.copyWith(alertmessage: alertremessage));
      LoginStatus.unsuccessfullogin;
    }
  }

  void _onclearlogin(onclearlogin event, Emitter<LoginState> emit) async {
    emit(
        state.copyWith(email: '', password: '', loginStatus: LoginStatus.none));
    print('${state.email}');
  }

  // void _showerror(showerror event, Emitter<LoginState> emit) {
  //   final BuildContext context = event.context;
  //   final message = event.message;
  //   if (message != '') CustomSnackbar.show(context, '$message');
  // }
}
