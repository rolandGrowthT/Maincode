import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/Cuser_bloc/cuser_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:flutter_bloc_testing/data/repository/Firebase_services.dart';
import 'package:flutter_bloc_testing/models/CurrentUser_model.dart';
import 'package:flutter_bloc_testing/presentation/shared_widgets/CustomSnackbar_Widget.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<String> signIn(
    BuildContext context, String email, String password) async {
  String temp = '';
  try {
    await _auth.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());

    context.read<CuserBloc>().add(getuser());
    Navigator.popUntil(context, (route) => route.isFirst);
  } catch (e) {
    print('Invalid password');
    if (e is FirebaseAuthException &&
        email.trim() != '' &&
        password.trim() != '') {
      CustomSnackbar.show(context, '${e.message}');
    } else {
      if (email.trim() == '' && password.trim() == '') {
        temp = 'Please enter an email and password';
      } else if (email.trim() != '' && password.trim() == '') {
        temp = 'Please enter a password';
      } else {
        temp = 'Please enter an email';
      }
    }
  }
  return temp;
}

Future<String> signUp(BuildContext context, String email, String password,
    String firstName, String lastName) async {
  String temp = '';
  int Except = 0;

  if (firstName.trim() == '' && lastName.trim() == '') {
    Except = 1;
    CustomSnackbar.show(
        context, 'Please provide a valid first name and last name');
  } else if (firstName.trim() == '' && lastName.trim() != '') {
    Except = 1;
    temp = 'Please provide a valid first name ';
  } else if (firstName.trim() != '' && lastName.trim() == '') {
    Except = 1;
    temp = 'Please provide a valid last name';
  } else {
    Except = 0;
  }

  if (Except == 0) {
    try {
      print('Sign Up button pressed');
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        insertuser(user.uid, firstName.trim(), lastName.trim());
        // fetchCurrentuser(user.uid);
      }
      context.read<CuserBloc>().add(getuser());
      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      print('firebase error');
      if (e is FirebaseAuthException &&
          email.trim() != '' &&
          password.trim() != '') {
        temp = '${e.message}';
      } else {
        if (email.trim() == '' && password.trim() == '')
          temp = 'Please enter an email and password';
        else if (email.trim() != '' && password.trim() == '')
          temp = 'Please enter a password';
        else
          temp = 'Please enter an email';
      }
    }
  }
  return temp;
}

Future<CurrentUserModel?> getUserById(String userId) async {
  try {
    final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('users_collection')
            .doc(userId)
            .get();
    if (userSnapshot.exists) {
      final userData = userSnapshot.data();
      return CurrentUserModel(
        id: userId,
        firstName: userData?['firstName'] ?? '',
        lastName: userData?['lastName'] ?? '',
      );
    }
  } catch (e) {
    print('Error fetching user data: $e');
  }
  return null;
}

Future<void> clearuser(BuildContext context) async {
  context.read<LoginBloc>().add(onclearlogin());
  context.read<SignupBloc>().add(onclearsignup());
}
