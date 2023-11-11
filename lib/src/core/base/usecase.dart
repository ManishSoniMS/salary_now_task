import 'package:freezed_annotation/freezed_annotation.dart';

import 'type_defs.dart';

@immutable
abstract class IUseCase<ReturnType, Params> {
  /// {@macro src.core.base.usecase.UseCase}
  const IUseCase();

  /// an override of `call` to execute this use case
  FailureOr<ReturnType> call(Params param);
}


