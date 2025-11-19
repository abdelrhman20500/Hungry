import 'package:hungry/features/side_option/data/model/ide_option_model.dart';

abstract class SideOptionState{}
class SideOptionInitial extends SideOptionState{}
class SideOptionLoading extends SideOptionState{}
class SideOptionFailure extends SideOptionState{
  final String errMessage;
  SideOptionFailure({required this.errMessage});
}
class SideOptionSuccess extends SideOptionState{
  final SideOptionModel sideOptionModel;
  SideOptionSuccess({required this.sideOptionModel});
}