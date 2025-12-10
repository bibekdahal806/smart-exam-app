// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:q_bank/common/bloc/image_picker/image_picker_cubit.dart'
    as _i506;
import 'package:q_bank/core/core.dart' as _i1021;
import 'package:q_bank/core/di/service_module.dart' as _i771;
import 'package:q_bank/core/network/dio/config/dio_config.dart' as _i130;
import 'package:q_bank/core/network/dio/dio_client.dart' as _i532;
import 'package:q_bank/core/network/dio/interceptors/logout_interceptor.dart'
    as _i671;
import 'package:q_bank/core/network/service/remote_service_impl.dart' as _i838;
import 'package:q_bank/core/utils/helpers/connectivity_helper.dart' as _i443;
import 'package:q_bank/core/utils/helpers/image_picker/image_picker_helper.dart'
    as _i435;
import 'package:q_bank/modules/onboarding/data/repository/onboarding_repository_impl.dart'
    as _i278;
import 'package:q_bank/modules/onboarding/domain/use_case/get_or_set_initial_show_onboarding_value_use_case.dart'
    as _i935;
import 'package:q_bank/modules/onboarding/domain/use_case/set_show_onboarding_value_use_case.dart'
    as _i110;
import 'package:q_bank/modules/onboarding/onboarding.dart' as _i577;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final serviceModule = _$ServiceModule();
    gh.factory<_i671.LogoutInterceptor>(() => _i671.LogoutInterceptor());
    gh.factory<_i130.DioConfigs>(() => _i130.DioConfigs());
    gh.factory<_i532.DioClient>(() => _i532.DioClient());
    gh.factory<_i435.ImagePickerHelper>(() => _i435.ImagePickerHelper());
    gh.singleton<_i558.FlutterSecureStorage>(() => serviceModule.secureStorage);
    gh.singleton<_i895.Connectivity>(() => serviceModule.connectivity());
    gh.lazySingleton<_i361.Dio>(() => serviceModule.dio);
    gh.factory<_i577.OnboardingRepository>(
      () => _i278.OnboardingRepositoryImpl(),
    );
    gh.factory<_i935.GetOrSetInitialShowOnboardingValueUseCase>(
      () => _i935.GetOrSetInitialShowOnboardingValueUseCase(
        gh<_i577.OnboardingRepository>(),
      ),
    );
    gh.factory<_i1021.RemoteService>(() => _i838.RemoteServiceImpl());
    gh.singleton<_i443.ConnectivityHelper>(
      () => _i443.ConnectivityHelper(gh<_i895.Connectivity>()),
    );
    gh.factory<_i110.SetShowOnboardingValueUseCase>(
      () =>
          _i110.SetShowOnboardingValueUseCase(gh<_i577.OnboardingRepository>()),
    );
    gh.factory<_i506.ImagePickerCubit>(
      () => _i506.ImagePickerCubit(gh<_i1021.ImagePickerHelper>()),
    );
    return this;
  }
}

class _$ServiceModule extends _i771.ServiceModule {}
