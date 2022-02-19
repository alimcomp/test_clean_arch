// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'cubit/other_cubit.dart' as _i4;
import 'cubit/test_cubit.dart' as _i5;
import 'test_usecase.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule(get);
  gh.factory<_i3.TestRepository>(() => _i3.TestRepositoryImpl());
  gh.factory<_i3.TestUseCase>(() => registerModule.testUseCase);
  gh.lazySingleton<_i4.OtherCubit>(() => _i4.OtherCubit(get<_i3.TestUseCase>()),
      dispose: (i) => i.close());
  gh.lazySingleton<_i5.TestCubit>(
      () => _i5.TestCubit(get<_i3.TestUseCase>(), get<_i4.OtherCubit>()),
      dispose: (i) => i.close());
  return get;
}

class _$RegisterModule extends _i3.RegisterModule {
  _$RegisterModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.TestUseCase get testUseCase =>
      _i3.TestUseCase(_getIt<_i3.TestRepository>());
}
