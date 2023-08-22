import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'guest_event.dart';
part 'guest_state.dart';

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc() : super(GuestState()) {
    on<incrementchildren>(_incrementchildren);
    on<decrementchildren>(_decrementchildren);
    on<incrementadults>(_incrementadults);
    on<decrementadults>(_decrementadults);
    on<onclear>(_onclear);
    on<setvalue>(_setvalue);
    on<checkvalidity>(_checkvalidity);
  }
  void _incrementchildren(
      incrementchildren event, Emitter<GuestState> emit) async {
    List<int> temp = List.from(state.childrenlist);
    temp.add(0);
    emit(state.copyWith(children: state.children + 1, childrenlist: temp));
  }

  void _decrementchildren(decrementchildren event, Emitter<GuestState> emit) {
    if (state.children > 0) {
      List<int> temp = List.from(state.childrenlist);

      temp.removeLast();
      emit(state.copyWith(children: state.children - 1, childrenlist: temp));
    }
  }

  void _incrementadults(incrementadults event, Emitter<GuestState> emit) {
    emit(state.copyWith(Adults: state.Adults + 1));
  }

  void _decrementadults(decrementadults event, Emitter<GuestState> emit) {
    if (state.Adults > 0) emit(state.copyWith(Adults: state.Adults - 1));
  }

  void _onclear(onclear event, Emitter<GuestState> emit) {
    List<int> temp = [];
    emit(state.copyWith(Adults: 0, children: 0, childrenlist: temp));
  }

  void _setvalue(setvalue event, Emitter<GuestState> emit) {
    List<int> temp = List.from(state.childrenlist);
    final int ind = event.index;
    final int val = event.value;
    temp[ind] = val;
    emit(state.copyWith(childrenlist: temp));
  }

  void _checkvalidity(checkvalidity event, Emitter<GuestState> emit) {
    int temp = 1;
    for (int i = 0; i < state.children; i++) {
      if (state.childrenlist[i] == 0) {
        temp = 0;
        emit(state.copyWith(isvalid: false));
      }
    }
    if (state.Adults == 0 || temp == 0) {
      emit(state.copyWith(isvalid: false));
    } else {
      emit(state.copyWith(isvalid: true));
    }
  }
}
