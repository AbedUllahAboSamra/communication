import 'package:new_sulution_test/core/error/failure.dart';
import 'package:new_sulution_test/featuers/auth/domain/entities/users.dart';

import '../repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';
class SignInWithGoogleUseCase {
 final UserRepositories repository;

  SignInWithGoogleUseCase({required this.repository});




 Future<Either<Failure, Users>> call() async {
    return await repository.signInWithGoogle();
  }




}