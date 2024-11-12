// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../api/client.dart' as _i265;
import 'di_container.dart' as _i198;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i361.BaseOptions>(() => appModule.dioOption);
  gh.singleton<_i974.Logger>(() => appModule.logger);
  await gh.singletonAsync<_i460.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i361.Dio>(() => appModule.dio(
        gh<_i361.BaseOptions>(),
        gh<_i974.Logger>(),
      ));
  gh.factory<_i265.ClientApi>(() => _i265.ClientApi(gh<_i361.Dio>()));
  return getIt;
}

class _$AppModule extends _i198.AppModule {}
