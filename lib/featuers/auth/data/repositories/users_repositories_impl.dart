import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_sulution_test/core/error/failure.dart';
import 'package:new_sulution_test/featuers/auth/domain/entities/users.dart';
import 'package:new_sulution_test/featuers/auth/domain/repositories/user_repositories.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../data_sources/remote/user_remote_data.dart';

class UserRepositoriesImpl extends UserRepositories {
  final NetworkInfo networkInfo;

  //final MovieLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;

  UserRepositoriesImpl({
    // required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Users>> getUserData({required String id}) async {
    // TODO: implement getUserData
    bool isConnect = await networkInfo.isConnected;

    if (isConnect) {
      try {
        Users user = await remoteDataSource.getUserData(id: id);
        return Right(user);
      } on Exception catch (ex) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Users>> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    // TODO: implement loginUserWithEmailAndPassword
    bool isConnect = await networkInfo.isConnected;
    print("loginUserWithEmailAndPassword");
    if (isConnect) {
      try {
        print("remoteDataSource ");
        Users currentUser = await remoteDataSource
            .loginUserWithEmailAndPassword(email: email, password: password);
        print("currentUser currentUser ");

        return Right(currentUser);
      } on Exception catch (ex) {
        print("ServerException ServerException ");

        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Users>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    // TODO: implement getUserData
    bool isConnect = await networkInfo.isConnected;

    if (isConnect) {
      try {
        var user = await remoteDataSource.signUp(
            email: email, name: name, password: password);
        return Right(user);
      } on Exception catch (exception) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Users>> signInWithFacebook() async {
    // TODO: implement signInWithFacebook
    bool isConnect = await networkInfo.isConnected;

    if (isConnect) {
      try {
        final user = await remoteDataSource.signInWithFacebook();

        return Right(user);
      } on Exception catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Users>> signInWithGoogle() async {
    // TODO: implement signInWithGoogle

    bool isConnect = await networkInfo.isConnected;

    if (isConnect) {
      try {
        final user = await remoteDataSource.signInWithGoogle();
        return Right(user);
      } on Exception catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
