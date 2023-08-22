import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_bloc_testing/data/enum/Login.dart';
import 'package:flutter_bloc_testing/navigation/Navigators.dart';
import 'package:flutter_bloc_testing/presentation/shared_widgets/CustomSnackbar_Widget.dart';
import 'package:flutter_bloc_testing/presentation/shared_widgets/Loading_Widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String temp = '';
  bool isobscured = true;
  String imageused = 'assets/icons/Group 11783.svg';
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 28, 0, 30),
                      child: Image.asset(
                        'assets/pics/Group 10961.png',
                        height: 48,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 10, 0, 12),
                      child: Text(
                        'You need to login to complete the booking process',
                        style: TextStyle(
                            fontSize: 12, fontFamily: 'MontserratRegular'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 34, 30, 24),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0),
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
                                    .read<LoginBloc>()
                                    .add(onemailchanged(email)),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'MontserratRegular'),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
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
                                        .read<LoginBloc>()
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(255, 0, 0, 50),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: Colors.blue,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: ElevatedButton(
                        onPressed: () async {
                          print('Login button pressed');
                          context.read<LoginBloc>().add(
                              onlogin(state.email, state.password, context));
                          temp = state.alertmessage;
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
                          'LOG IN',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontFamily: 'MontserratMedium',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(82, 275, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontFamily: 'MontserratSemiBold', fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigation.goto('/SignUpPage');
                            },
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.none,
                                fontFamily: 'MontserratSemiBold',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                state.loginStatus == LoginStatus.loading
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
