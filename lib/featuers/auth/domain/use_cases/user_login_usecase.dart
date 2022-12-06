import 'package:new_sulution_test/core/error/failure.dart';
import 'package:new_sulution_test/featuers/auth/domain/entities/users.dart';
import 'package:dartz/dartz.dart';
import '../repositories/user_repositories.dart';

class LoginUserWithEmailAndPasswordUseCase {
  final UserRepositories repository;

  const LoginUserWithEmailAndPasswordUseCase({required this.repository});

  Future<Either<Failure, Users>> call({
    required String email,
    required String password,
  }) async {
    return await repository.loginUserWithEmailAndPassword(
        email: email, password: password);
  }
}
