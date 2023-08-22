part of 'guest_bloc.dart';

@immutable
class GuestEvent extends Equatable {
  const GuestEvent();
  List<Object> get props => [];
}

class incrementchildren extends GuestEvent {
  const incrementchildren();
  List<Object> get props => [];
}

class decrementchildren extends GuestEvent {
  const decrementchildren();
  List<Object> get props => [];
}

class incrementadults extends GuestEvent {
  const incrementadults();
  List<Object> get props => [];
}

class decrementadults extends GuestEvent {
  const decrementadults();
  List<Object> get props => [];
}

class onclear extends GuestEvent {
  const onclear();
  List<Object> get props => [];
}

class setvalue extends GuestEvent {
  final int index;
  final int value;
  const setvalue(this.index, this.value);
  List<Object> get props => [index, value];
}

class checkvalidity extends GuestEvent {
  const checkvalidity();
  List<Object> get props => [];
}
