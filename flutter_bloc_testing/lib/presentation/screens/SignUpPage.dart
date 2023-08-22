import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:flutter_bloc_testing/data/enum/Signup.dart';
import 'package:flutter_bloc_testing/presentation/shared_widgets/CustomSnackbar_Widget.dart';
import 'package:flutter_bloc_testing/presentation/shared_widgets/Loading_Widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String temp = '';
  int Except = 0;
  bool isobscured = true;
  String imageused = 'assets/icons/Group 11783.svg';
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(175, 0, 0, 20),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontFamily: 'MontserratMedium', fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'MontserratRegular',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
                              child: TextField(
                                onChanged: (email) => context
                                    .read<SignupBloc>()
                                    .add(onemailchanged(email)),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'MontserratMedium'),
                                decoration: InputDecoration(
                                  hintText: 'JohnDoe@otonomus.com',
                                  hintStyle:
                                      TextStyle(color: Color(0xFFB2BBCA)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'MontserratRegular',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 2, 0, 0),
                                  child: TextField(
                                    obscureText: isobscured,
                                    onChanged: (password) => context
                                        .read<SignupBloc>()
                                        .add(onpasswordchanged(password)),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'MontserratMedium'),
                                    decoration: InputDecoration(
                                      hintText: '**********',
                                      hintStyle:
                                          TextStyle(color: Color(0xFFB2BBCA)),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(300, 5, 0, 5),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isobscured = !isobscured;
                                  });
                                },
                                icon: isobscured
                                    ? SvgPicture.asset(
                                        'assets/icons/Group 13829.svg',
                                        width: 18,
                                        height: 18,
                                      )
                                    : SvgPicture.asset(
                                        'assets/icons/Group 11783.svg',
                                        width: 18,
                                        height: 18,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                              child: Text(
                                'First Name',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'MontserratRegular',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
                              child: TextField(
                                onChanged: (firstname) => context
                                    .read<SignupBloc>()
                                    .add(onfnamechanged(firstname)),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'MontserratMedium'),
                                decoration: InputDecoration(
                                  hintText: 'John',
                                  hintStyle:
                                      TextStyle(color: Color(0xFFB2BBCA)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                              child: Text(
                                'Last Name',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'MontserratRegular',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
                              child: TextField(
                                onChanged: (lastname) => context
                                    .read<SignupBloc>()
                                    .add(onlnamechanged(lastname)),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'MontserratMedium'),
                                decoration: InputDecoration(
                                  hintText: 'Doe',
                                  hintStyle:
                                      TextStyle(color: Color(0xFFB2BBCA)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(26, 300, 26, 70),
                      child: ElevatedButton(
                        onPressed: () async {
                          print('SignUp button pressed');
                          context.read<SignupBloc>().add(onsignup(state.email, state.password, state.fname, state.lname, context));
                          temp =state.alertmessage;
                          if (temp != '') CustomSnackbar.show(context, '$temp');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF297BE6),
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontFamily: 'MontserratMedium',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                state.signupStatus == SignupStatus.loading
                    ? LoadingWidget()
                    : SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
