


import 'package:dartz/dartz.dart';
import 'package:new_sulution_test/featuers/auth/domain/repositories/user_repositories.dart';

import '../../../../core/error/failure.dart';
import '../entities/users.dart';

class SignUpUseCase {
 final UserRepositories  repository;
 SignUpUseCase({required this.repository});


 Future<Either<Failure, Users>> call({ required String name,
   required String email,
   required String password,}) async {
   return await repository.signUp(name: name, email: email, password: password);
 }
}