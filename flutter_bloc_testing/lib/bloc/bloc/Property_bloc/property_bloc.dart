import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_testing/data/repository/Services.dart';
import 'package:flutter_bloc_testing/models/Property_model.dart';
import 'package:flutter_bloc_testing/models/Space_model.dart';
import 'package:meta/meta.dart';

part 'property_event.dart';
part 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  PropertyBloc() : super(PropertyState()) {
    on<onpropertyfill>(_onpropertyfill);
    on<updateselection>(_updateselection);
    on<updatedot>(_updatedot);
  }
  PropertyServices services = PropertyServices();
  Future _onpropertyfill(onpropertyfill event, Emitter<PropertyState>emit) async{
   List <PropertyModel> properties = await services.getAllAvailableProperties();
   final PropertyModel updatedpropertyselection = properties[0];
    emit(state.copyWith(property: properties, selectedproperty: updatedpropertyselection));
  }
  void _updateselection(updateselection event, Emitter<PropertyState>emit){
    final PropertyModel updatedpropertyselection = event.selection;
    emit(state.copyWith(selectedproperty: updatedpropertyselection));
  }
void _updatedot(updatedot event, Emitter<PropertyState>emit){
  final SpaceModel space1=event.dotselected;
  emit(state.copyWith(space1:space1));
}
}
