
import '../../../auth/domain/entities/users.dart';

class Funerals {
  final int id;
  final String name;
  final String imageUrl;
  final String day;
  final String month;
  final String date;
  final List<Users> users;

  Funerals({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.day,
    required this.month,
    required this.date,
    required this.users,
  });
}
