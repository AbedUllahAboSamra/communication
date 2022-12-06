import 'package:dartz/dartz.dart';
import 'package:new_sulution_test/core/error/failure.dart';
import 'package:new_sulution_test/featuers/auth/domain/entities/users.dart';

abstract class UserRepositories {
  Future<Either<Failure, Users>> loginUserWithEmailAndPassword ({
    required String email,
    required String password,
  });

  Future<Either<Failure, Users>> getUserData ({
    required String id,
  });

  Future<Either<Failure, Users>> signUp ({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, Users>> signInWithFacebook ();
  Future<Either<Failure, Users>> signInWithGoogle ();

}
