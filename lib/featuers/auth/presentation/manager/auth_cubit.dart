import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_sulution_test/featuers/auth/domain/use_cases/sign_in_with_facebook_usecase.dart';
import 'package:new_sulution_test/featuers/auth/domain/use_cases/sign_in_with_google_usecase.dart';
import 'package:new_sulution_test/featuers/auth/domain/use_cases/sign_up_use_case.dart';

import '../../../../core/error/error_strings.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/users.dart';
import '../../domain/use_cases/user_login_usecase.dart';
import 'auth_state.dart';
import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.loginUseCase,
    required this.signUpUseCase,
    required this.signInWithFaceBookUseCase,
    required this.signInWithGoogleUseCase,
  }) : super(AuthInitial());

  final LoginUserWithEmailAndPasswordUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final SignInWithFaceBookUseCase signInWithFaceBookUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;

  // instance of the class auth cubit
  static AuthCubit get(context) => BlocProvider.of(context);

  // values
  Users? users;

  // functions
  // ---
  // login with email and password
  void login({
    required String email,
    required String password,
  }) async {
    print("state is loading");
    emit(AuthWithEmailLoading());
    var eitherUserOfFailure =
        await loginUseCase.call(email: email, password: password);
    eitherUserOfFailure.fold(
      (failure) {
        print("state is failure");

        emit(AuthWithEmailLoadError(error: _mapFailureToMessage(failure)));
      },
      (user) {
        print("state is user");

        users = user;
        emit(AuthWithEmailLoaded(
          user: user,
        ));
      },
    );
  }

  // sign up method
  void signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthSignUplLoading());
    var eitherUserOfFailure =
        await signUpUseCase.call(email: email, password: password, name: name);
    eitherUserOfFailure.fold(
      (failure) {
        emit(AuthSignUpError(error: _mapFailureToMessage(failure)));
      },
      (user) {
        users = user;
        emit(AuthSignUpLoaded(user: user));
      },
    );
  }

  // face book
  Future<void> signInWithFacebook() async {
    emit(AuthSignInWithFaceBookLoading());
    var eitherFailureOrUser = await signInWithFaceBookUseCase.call();
    eitherFailureOrUser.fold(
      (failure) {
        emit(AuthSignInWithFaceBookError(error: _mapFailureToMessage(failure)));
      },
      (user) {
        users = user;
        emit(AuthSignInWithFaceBookLoaded(user: user));
      },
    );
  }

  // google

  Future<void> googleSignIn() async {
    emit(AuthSignInWithGoogleLoading());
    final userOrFailure = await signInWithGoogleUseCase.call();

    userOrFailure.fold(
      (failure) {
        emit(AuthSignInWithGoogleError(error: _mapFailureToMessage(failure)));
      },
      (user) {
        print("${user}user ");
        users = user;
        emit(AuthSignInWithGoogleLoaded(user: user));
      },
    );
  }

  // get failure String Message
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
