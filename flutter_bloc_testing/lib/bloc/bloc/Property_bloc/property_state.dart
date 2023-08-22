// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'property_bloc.dart';

@immutable
class PropertyState extends Equatable {
  final List<PropertyModel> property;
  final PropertyModel selectedproperty;
  final SpaceModel space1;
  const PropertyState({
    this.selectedproperty = PropertyModel.empty,
    this.property = const [PropertyModel.empty],
    this.space1 =  SpaceModel.empty});
  List<Object?> get props => [property, selectedproperty, space1];

  PropertyState copyWith(
      {List<PropertyModel>? property,
      PropertyModel? selectedproperty,
      SpaceModel? space1}) {
    return PropertyState(
        space1: space1 ?? this.space1,
        property: property ?? this.property,
        selectedproperty: selectedproperty ?? this.selectedproperty);
  }
}
