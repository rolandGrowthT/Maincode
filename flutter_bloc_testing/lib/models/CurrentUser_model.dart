class CurrentUserModel {
  final String id;
  final String firstName;
  final String lastName;

const  CurrentUserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });
  static const empty = CurrentUserModel(id: '', firstName: '', lastName: '');
}
