import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_testing/data/enum/Cuser.dart';
import 'package:flutter_bloc_testing/data/repository/Authentication_Services.dart';
import 'package:flutter_bloc_testing/models/CurrentUser_model.dart';
import 'package:meta/meta.dart';

part 'cuser_event.dart';
part 'cuser_state.dart';

class CuserBloc extends Bloc<CuserEvent, CuserState> {
  CuserBloc() : super(CuserState()) {
    on<getuser>(_getuser);
    on<SignOut>(_signout);
  }
  void _getuser(getuser event, Emitter<CuserState> emit) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final Cuser = await (getUserById(user!.uid));
    emit(state.copyWith(Cuser: Cuser, cuserStatus: CuserStatus.logged));
  }

  void _signout(SignOut event, Emitter<CuserState> emit) async {
    await FirebaseAuth.instance.signOut();
    final BuildContext context = event.context;
    await clearuser(context);
    emit(state.copyWith(
        cuserStatus: CuserStatus.notlogged,
        Cuser: const CurrentUserModel(id: '', firstName: '', lastName: '')));
  }
}
