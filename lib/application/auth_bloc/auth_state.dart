part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String error,
    @Default(false) bool isLogged,
    @Default(false) bool isSign,
  }) = _AuthState;
}
