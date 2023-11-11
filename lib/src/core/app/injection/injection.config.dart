// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../external/register_module.dart' as _i10;
import '../../../features/upload/data/repository/upload_repository_impl.dart'
    as _i6;
import '../../../features/upload/data/source/upload_source.dart' as _i4;
import '../../../features/upload/domain/repository/upload_repository.dart'
    as _i5;
import '../../../features/upload/domain/usecases/upload_image_usecase.dart'
    as _i7;
import '../../../features/upload/domain/usecases/upload_pdf_usecase.dart'
    as _i8;
import '../../../features/upload/presentation/bloc/upload/upload_cubit.dart'
    as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initSL(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Dio>(registerModule.dio);
  gh.lazySingleton<_i4.IUploadSource>(
      () => _i4.UploadSourceImpl(gh<_i3.Dio>()));
  gh.lazySingleton<_i5.UploadRepository>(
      () => _i6.UploadRepositoryImpl(gh<_i4.IUploadSource>()));
  gh.lazySingleton<_i7.UploadImageUsecase>(
      () => _i7.UploadImageUsecase(repository: gh<_i5.UploadRepository>()));
  gh.lazySingleton<_i8.UploadPDFUsecase>(
      () => _i8.UploadPDFUsecase(repository: gh<_i5.UploadRepository>()));
  gh.factory<_i9.UploadCubit>(() => _i9.UploadCubit(
        gh<_i7.UploadImageUsecase>(),
        gh<_i8.UploadPDFUsecase>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i10.RegisterModule {}
