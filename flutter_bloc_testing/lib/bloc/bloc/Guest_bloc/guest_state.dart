// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'guest_bloc.dart';

@immutable
class GuestState extends Equatable {
 final int children;
 final int Adults;
 final List<int> childrenlist;
 final bool isvalid;
 const GuestState({
  this.Adults=0,
  this.children=0,
  this.isvalid=false,
  this.childrenlist=const []}
 );
List<Object?> get props => [children,Adults,childrenlist,isvalid];
  GuestState copyWith({
    int? children,
    int? Adults,
    bool? isvalid,
    List<int>? childrenlist,
  }) {
    return GuestState(
      children: children ?? this.children,
      Adults: Adults ?? this.Adults,
      isvalid: isvalid ?? this.isvalid,
      childrenlist: childrenlist ?? this.childrenlist
    );
  }
}

