import 'package:flutter_bloc_1/auth/bloc/sign_event.dart';
import 'package:flutter_bloc_1/auth/bloc/sign_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmitted>((event, emit) async {
      if (event.email.isEmpty || !event.email.contains('@')) {
        emit(SignUpFailure(error: 'Invalid email address'));
      } else if (event.password.length < 6) {
        emit(SignUpFailure(error: 'Password must be at least 6 characters'));
      } else if (event.password != event.confirmPassword) {
        emit(SignUpFailure(error: 'confirmPassword does not match password'));
      } else if (event.username.isEmpty) {
        emit(SignUpFailure(error: 'Username cannot be empty'));
      } else {
        emit(SignUpSuccess());
      }
    });
  }
}