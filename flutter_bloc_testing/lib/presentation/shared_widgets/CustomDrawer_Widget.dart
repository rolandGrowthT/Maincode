import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/Cuser_bloc/cuser_bloc.dart';
import 'package:flutter_bloc_testing/navigation/Navigators.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String logging = 'Login';
  void initState() {
    final user = _auth.currentUser;
    if (user != null) {
      // Provider.of<CurrentUserProvider>(context, listen: false)
      //     .fetchCurrentuser(user.uid);
      logging = 'Logout';
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    // CurrentUserModel Cuser = Provider.of<CurrentUserProvider>(context).Cuser;
    return BlocBuilder<CuserBloc, CuserState>(
      builder: (context, state) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 208,
                width: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF3C4955),
                  ),
                  child: Image.asset(
                    'assets/pics/Mask Group.png',
                  ),
                ),
              ),
              if (logging != 'Login')
                ListTile(
                  title: Text(
                    'Welcome ${state.Cuser.firstName}',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              if (logging != 'Login')
                ListTile(
                  title: Text('Your profile'),
                  onTap: () async {
                    Navigation.goto('/SignUpPage');
                  },
                ),
              ListTile(
                title: Text('$logging'),
                onTap: () async {
                  try {
                    if (logging == 'Logout') {
                      context.read<CuserBloc>().add(SignOut(context));
                      Scaffold.of(context).openEndDrawer();
                      Navigator.popUntil(context, (route) => route.isFirst);
                    } else {
                      Scaffold.of(context).openEndDrawer();

                      Navigation.goto('/LoginPage');
                    }
                  } catch (e) {
                    print('Error logging out');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
