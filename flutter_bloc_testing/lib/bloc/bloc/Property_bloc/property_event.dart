part of 'property_bloc.dart';

@immutable
class PropertyEvent extends Equatable{
  const PropertyEvent();
  List<Object> get props =>[];
}
class onpropertyfill extends PropertyEvent{
  const onpropertyfill(
  );
  List<Object> get props => [];
}
class updateselection extends PropertyEvent{
  final PropertyModel selection;
  const updateselection(
    this.selection
  );
  List<Object> get props =>[selection];
}
class updatedot extends PropertyEvent{
  final SpaceModel dotselected;
  final int i;
  const updatedot(
    this.dotselected,
    this.i,
  );
  List<Object> get props =>[dotselected,i];
}