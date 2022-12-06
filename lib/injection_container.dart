import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:new_sulution_test/core/network/network_info.dart';
import 'package:new_sulution_test/featuers/auth/data/data_sources/remote/user_remote_data.dart';
import 'package:new_sulution_test/featuers/auth/data/repositories/users_repositories_impl.dart';
import 'package:new_sulution_test/featuers/auth/domain/repositories/user_repositories.dart';
import 'package:new_sulution_test/featuers/auth/domain/use_cases/sign_in_with_google_usecase.dart';
import 'package:new_sulution_test/featuers/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:new_sulution_test/featuers/auth/domain/use_cases/user_login_usecase.dart';
import 'package:new_sulution_test/featuers/auth/presentation/manager/auth_cubit.dart';

import 'featuers/auth/domain/use_cases/sign_in_with_facebook_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await Firebase.initializeApp();
  //Bloc

  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(
        loginUseCase: sl<LoginUserWithEmailAndPasswordUseCase>(),
        signInWithFaceBookUseCase: sl<SignInWithFaceBookUseCase>(),
        signInWithGoogleUseCase: sl<SignInWithGoogleUseCase>(),
        signUpUseCase: sl<SignUpUseCase>(),
      ));

  //Use case
  sl.registerLazySingleton<LoginUserWithEmailAndPasswordUseCase>(
    () => LoginUserWithEmailAndPasswordUseCase(
      repository: sl<UserRepositories>(),
    ),
  );

  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(
      repository: sl<UserRepositories>(),
    ),
  );

  sl.registerLazySingleton<SignInWithFaceBookUseCase>(
    () => SignInWithFaceBookUseCase(
      repository: sl<UserRepositories>(),
    ),
  );

  sl.registerLazySingleton<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(
      repository: sl<UserRepositories>(),
    ),
  );

  //Repository
  sl.registerLazySingleton<UserRepositories>(() => UserRepositoriesImpl(
        remoteDataSource: sl<UserRemoteDataSource>(),
        networkInfo: sl<NetworkInfo>(),
      ));

// Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      authInstance: sl<FirebaseAuth>(),
      storeInstance: sl<FirebaseFirestore>(),
    ),
  );

//! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl<InternetConnectionChecker>()));

//! External
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
