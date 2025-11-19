import 'package:dartz/dartz.dart';
import 'package:hungry/features/side_option/data/model/ide_option_model.dart';

import '../../../../core/utils/errors/failure.dart';

abstract class SideOptionRepo{
  Future<Either<Failure, SideOptionModel>> sideOptionData();
}