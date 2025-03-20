part of 'forgetpassword_cubit.dart';

@immutable
sealed class ForgetpasswordState {}

final class ForgetpasswordInitial extends ForgetpasswordState {}

final class ForgetpasswordLoading extends ForgetpasswordState {}

final class ForgetpasswordSuccess extends ForgetpasswordState {}

final class ForgetpasswordError extends ForgetpasswordState {
  ForgetpasswordError(this.message);
  final String message;
}
