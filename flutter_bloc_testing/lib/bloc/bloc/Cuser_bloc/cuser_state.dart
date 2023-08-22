// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cuser_bloc.dart';

@immutable
class CuserState extends Equatable {
  final CuserStatus cuserStatus;
  final CurrentUserModel Cuser;
  const CuserState(
      {this.cuserStatus = CuserStatus.notlogged,
      this.Cuser = CurrentUserModel.empty});
  List<Object?> get props => [cuserStatus, Cuser];

  CuserState copyWith({
    CuserStatus? cuserStatus,
    CurrentUserModel? Cuser,
  }) {
    return CuserState(
      cuserStatus: cuserStatus ?? this.cuserStatus,
      Cuser: Cuser ?? this.Cuser,
    );
  }
}
