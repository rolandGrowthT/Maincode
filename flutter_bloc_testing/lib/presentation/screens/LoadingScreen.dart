import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/Cuser_bloc/cuser_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/Property_bloc/property_bloc.dart';
import 'package:flutter_bloc_testing/presentation/screens/Home_Screen_Page.dart';
import 'package:provider/provider.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    initiating();
    checkAuthentication();
  }

  void initiating() {
    context.read<PropertyBloc>().add(onpropertyfill());
  }

  void checkAuthentication() async {
    await Future.delayed(Duration(seconds: 2));
    final user = _auth.currentUser;
    if (user!=null) {
      context.read<CuserBloc>().add(getuser());
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/pics/Group 10961.png',
        ),
      ),
    );
  }
}
