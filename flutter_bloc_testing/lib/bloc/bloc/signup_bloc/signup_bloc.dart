import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_testing/data/enum/Signup.dart';
import 'package:flutter_bloc_testing/data/repository/Authentication_Services.dart';
import 'package:flutter_bloc_testing/models/CurrentUser_model.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignUpEvent, SignUpState> {
  SignupBloc() : super(SignUpState()) {
    on<onfnamechanged>(_onfnamechanged);
    on<onlnamechanged>(_onlnamechanged);
    on<onemailchanged>(_onemailchanged);
    on<onpasswordchanged>(_onpasswordchanged);
    on<onsignup>(_onsignup);
    on<onclearsignup>(_onclearsignup);
  }

  void _onfnamechanged(onfnamechanged event, Emitter<SignUpState> emit) {
    final fname = event.firstname;
    emit(state.copyWith(fname: fname));
  }

  void _onlnamechanged(onlnamechanged event, Emitter<SignUpState> emit) {
    final lname = event.lastname;
    emit(state.copyWith(lname: lname));
  }

  void _onemailchanged(onemailchanged event, Emitter<SignUpState> emit) {
    final email = event.email;
    emit(state.copyWith(email: email));
  }

  void _onpasswordchanged(onpasswordchanged event, Emitter<SignUpState> emit) {
    final password = event.password;
    emit(state.copyWith(password: password));
  }

  void _onsignup(onsignup event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(signupStatus: SignupStatus.loading));

    final email = event.email;
    final password = event.password;
    final fname = event.fname;
    final lname = event.lname;
    final BuildContext context = event.context;
    String alertremessage =
        await signUp(context, email, password, fname, lname);
    emit(state.copyWith(signupStatus: SignupStatus.none));

    if (alertremessage == '') {
      emit(state.copyWith(alertmessage: alertremessage));
      SignupStatus.successfullogin;
    } else {
      emit(state.copyWith(alertmessage: alertremessage));
      SignupStatus.unsuccessfullogin;
    }
  }

  void _onclearsignup(onclearsignup event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
        email: '', password: '',fname: '',lname: '', signupStatus: SignupStatus.none));
    print('${state.email}');
  }
}
