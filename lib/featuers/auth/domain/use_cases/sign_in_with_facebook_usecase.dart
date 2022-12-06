import 'package:dartz/dartz.dart';
import 'package:new_sulution_test/core/error/failure.dart';
import 'package:new_sulution_test/featuers/auth/domain/entities/users.dart';
import 'package:new_sulution_test/featuers/auth/domain/repositories/user_repositories.dart';

class SignInWithFaceBookUseCase {
  final UserRepositories repository;

  SignInWithFaceBookUseCase({required this.repository});

  Future<Either<Failure, Users>> call() async {
    return await repository.signInWithFacebook();
  }
}
