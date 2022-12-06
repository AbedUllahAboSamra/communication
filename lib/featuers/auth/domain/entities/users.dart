import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final String imageUrl;
  final String phone;
  final String dateOfBirth;
  final String gender;
  final String location;

  const Users({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.imageUrl,
    required this.phone,
    required this.dateOfBirth,
    required this.gender,
    required this.location,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        imageUrl,
        phone,
        dateOfBirth,
        gender,
        location
      ];
}
