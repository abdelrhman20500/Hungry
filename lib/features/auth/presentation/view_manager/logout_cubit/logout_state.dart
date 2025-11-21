import 'package:hungry/features/auth/data/model/log_out_model.dart';

abstract class LogoutState{}
class LogoutInitial extends LogoutState{}
class LogoutLoading extends LogoutState{}
class LogoutFailure extends LogoutState{
  final String errMessage;
  LogoutFailure({required this.errMessage});
}
class LogoutSuccess extends LogoutState{
  final LogoutModel logoutModel;

  LogoutSuccess({required this.logoutModel});
}
