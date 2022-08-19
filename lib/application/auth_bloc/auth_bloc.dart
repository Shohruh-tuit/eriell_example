import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../services/user_data_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late Box<UserData> userBox;

  AuthBloc() : super(const _AuthState()) {
    on<SignUp>(_signUp);
    on<SignIn>(_sigIn);
  }

  Future<void> _signUp(SignUp event, Emitter<AuthState> emit) async {
    userBox = Hive.box('user_data');
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      error: '',
      isLogged: false,
    ));

    String userName = event.login;
    String name = event.name;
    String lastName = event.lastName;
    String password = event.password;

    UserData data = UserData(
      login: userName,
      name: name,
      lastName: lastName,
      password: password,
    );
    for (var value in userBox.values.map((e) => e.login)) {
      var index = userBox.values.where((element) => element.login == userName);
      if (index.isEmpty) {
        userBox.add(data);
        emit(state.copyWith(
          isLoading: false,
          hasError: false,
          isLogged: true,
        ));
        break;
      }
      if (userName == value) {
        emit(state.copyWith(
          isLoading: false,
          hasError: true,
          error: "This login already exists",
          isLogged: false,
        ));
      }
    }
  }

  Future<void> _sigIn(SignIn event, Emitter<AuthState> emit) async {
    userBox = Hive.box('user_data');
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      error: '',
      isLogged: false,
      isSign: false,
    ));

    for (var value in userBox.values.map((e) => e.login)) {
      if (event.login == value) {
        for (var pass in userBox.values.map((e) => e.password)) {
          if (event.password == pass) {
            emit(
              state.copyWith(
                isLoading: false,
                hasError: false,
                isLogged: false,
                isSign: true,
              ),
            );
          } else {}
        }
      } else {}
    }
  }
}
