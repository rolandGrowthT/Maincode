import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/Cuser_bloc/cuser_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/Guest_bloc/guest_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/Property_bloc/property_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:flutter_bloc_testing/data/repository/Firebase_services.dart';
import 'package:flutter_bloc_testing/navigation/Approutes.dart';
import 'package:flutter_bloc_testing/navigation/Navigators.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeFirestoreCollection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignupBloc(),
          ),
          BlocProvider(
            create: (context) => GuestBloc(),
          ),
          BlocProvider(
            create: (context) => CuserBloc(),
          ),
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) => PropertyBloc(),
          ),
        ],
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: Navigation.navigatorKey,
      initialRoute: '/loadingpage',
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
