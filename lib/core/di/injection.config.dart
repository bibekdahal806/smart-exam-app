// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

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
    as _i714;
import 'package:q_bank/core/core.dart' as _i255;
import 'package:q_bank/core/di/service_module.dart' as _i37;
import 'package:q_bank/core/network/dio/config/dio_config.dart' as _i729;
import 'package:q_bank/core/network/dio/dio_client.dart' as _i505;
import 'package:q_bank/core/network/dio/interceptors/logout_interceptor.dart'
    as _i1017;
import 'package:q_bank/core/network/service/remote_service_impl.dart' as _i203;
import 'package:q_bank/core/utils/helpers/connectivity_helper.dart' as _i93;
import 'package:q_bank/core/utils/helpers/image_picker/image_picker_helper.dart'
    as _i561;
import 'package:q_bank/modules/onboarding/data/repository/onboarding_repository_impl.dart'
    as _i37;
import 'package:q_bank/modules/onboarding/domain/use_case/get_or_set_initial_show_onboarding_value_use_case.dart'
    as _i947;
import 'package:q_bank/modules/onboarding/domain/use_case/set_show_onboarding_value_use_case.dart'
    as _i588;
import 'package:q_bank/modules/onboarding/onboarding.dart' as _i702;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final serviceModule = _$ServiceModule();
    gh.factory<_i729.DioConfigs>(() => _i729.DioConfigs());
    gh.factory<_i1017.LogoutInterceptor>(() => _i1017.LogoutInterceptor());
    gh.factory<_i561.ImagePickerHelper>(() => _i561.ImagePickerHelper());
    gh.singleton<_i558.FlutterSecureStorage>(() => serviceModule.secureStorage);
    gh.singleton<_i895.Connectivity>(() => serviceModule.connectivity());
    gh.lazySingleton<_i361.Dio>(() => serviceModule.dio);
    gh.factory<_i702.OnboardingRepository>(
      () => _i37.OnboardingRepositoryImpl(),
    );
    gh.factory<_i588.SetShowOnboardingValueUseCase>(
      () =>
          _i588.SetShowOnboardingValueUseCase(gh<_i702.OnboardingRepository>()),
    );
    gh.factory<_i255.RemoteService>(() => _i203.RemoteServiceImpl());
    gh.singleton<_i93.ConnectivityHelper>(
      () => _i93.ConnectivityHelper(gh<_i895.Connectivity>()),
    );
    gh.factory<_i505.DioClient>(() => _i505.DioClient(gh<_i255.DioConfigs>()));
    gh.factory<_i714.ImagePickerCubit>(
      () => _i714.ImagePickerCubit(gh<_i255.ImagePickerHelper>()),
    );
    gh.factory<_i947.GetOrSetInitialShowOnboardingValueUseCase>(
      () => _i947.GetOrSetInitialShowOnboardingValueUseCase(
        gh<_i702.OnboardingRepository>(),
      ),
    );
    return this;
  }
}

class _$ServiceModule extends _i37.ServiceModule {}
