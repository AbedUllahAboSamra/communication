import 'package:equatable/equatable.dart';
import '../../domain/entities/users.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}


// login states
class AuthWithEmailLoading extends AuthState {}
class AuthWithEmailLoaded extends AuthState {
  final Users user;

  const AuthWithEmailLoaded({required this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user];
}
class AuthWithEmailLoadError extends AuthState {
  final String error;

  const AuthWithEmailLoadError({required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

// signup states
class AuthSignUplLoading extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class AuthSignUpLoaded extends AuthState {
  final Users user;

  const AuthSignUpLoaded({required this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user];
}
class AuthSignUpError extends AuthState {
  final String error;

  const AuthSignUpError({required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [error];
}


// sign in with facebook
class AuthSignInWithFaceBookLoading extends AuthState{

}
class AuthSignInWithFaceBookError   extends AuthState{
  final String error ;

  const AuthSignInWithFaceBookError({
    required this.error
  });
  @override
  List<Object> get props => [error];

}
class AuthSignInWithFaceBookLoaded  extends AuthState{
  final Users user ;

  const AuthSignInWithFaceBookLoaded({
    required this.user
});
  @override
  List<Object> get props => [user];

}



// sign in with google
class AuthSignInWithGoogleLoading extends AuthState{}
class AuthSignInWithGoogleLoaded extends AuthState{
  final Users user ;
  const AuthSignInWithGoogleLoaded({required this.user});
}
class AuthSignInWithGoogleError extends AuthState{
  final String error ;
  const AuthSignInWithGoogleError({required this.error});
}
