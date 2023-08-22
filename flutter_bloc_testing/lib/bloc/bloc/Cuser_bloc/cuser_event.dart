part of 'cuser_bloc.dart';

@immutable
class CuserEvent extends Equatable {
  const CuserEvent();
  List<Object> get props => [];
}

class getuser extends CuserEvent {
  const getuser();
  List<Object> get props => [];
}

class SignOut extends CuserEvent {
  final BuildContext context;

  const SignOut(
    this.context,
  );
  List<Object> get props => [
        context,
      ];
}
