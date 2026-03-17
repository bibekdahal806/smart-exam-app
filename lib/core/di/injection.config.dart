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
import 'package:q_bank/modules/auth/auth.dart' as _i192;
import 'package:q_bank/modules/auth/data/repository/auth_repository_impl.dart'
    as _i157;
import 'package:q_bank/modules/auth/data/repository/logout_handler_impl.dart'
    as _i935;
import 'package:q_bank/modules/auth/domain/use_case/get_current_auth_state_use_case.dart'
    as _i999;
import 'package:q_bank/modules/auth/domain/use_case/get_logged_in_user_use_case.dart'
    as _i481;
import 'package:q_bank/modules/auth/domain/use_case/login_with_email_password_use_case.dart'
    as _i174;
import 'package:q_bank/modules/auth/domain/use_case/logout_use_case.dart'
    as _i311;
import 'package:q_bank/modules/auth/domain/use_case/register_user_use_case.dart'
    as _i396;
import 'package:q_bank/modules/bookmark/bookmark.dart' as _i327;
import 'package:q_bank/modules/bookmark/data/repository/local/local_bookmarked_exam_repository_impl.dart'
    as _i406;
import 'package:q_bank/modules/exam/data/repositories/local/local_exam_session_repository_impl.dart'
    as _i700;
import 'package:q_bank/modules/exam/data/repositories/remote/remote_exam_repository_impl.dart'
    as _i893;
import 'package:q_bank/modules/exam/exam.dart' as _i840;
import 'package:q_bank/modules/onboarding/data/repository/onboarding_repository_impl.dart'
    as _i37;
import 'package:q_bank/modules/onboarding/domain/use_case/get_or_set_initial_show_onboarding_value_use_case.dart'
    as _i947;
import 'package:q_bank/modules/onboarding/domain/use_case/set_show_onboarding_value_use_case.dart'
    as _i588;
import 'package:q_bank/modules/onboarding/onboarding.dart' as _i702;
import 'package:q_bank/modules/profile/features/delete_account/data/repository/delete_account_repository_impl.dart'
    as _i777;
import 'package:q_bank/modules/profile/features/delete_account/domain/use_case/delete_account_use_case.dart'
    as _i878;
import 'package:q_bank/modules/profile/features/edit_profile/data/repository/edit_profile_respository_impl.dart'
    as _i952;
import 'package:q_bank/modules/profile/features/edit_profile/domain/use_case/edit_user_data_usecase.dart'
    as _i696;
import 'package:q_bank/modules/profile/profile.dart' as _i370;
import 'package:q_bank/modules/subjects/data/repository/remote/remote_subject_repository_impl.dart'
    as _i142;
import 'package:q_bank/modules/subjects/subjects.dart' as _i825;

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
    gh.singleton<_i192.UserSessionRepository>(
      () => serviceModule.userSessionRepository,
    );
    gh.singleton<_i895.Connectivity>(() => serviceModule.connectivity());
    gh.lazySingleton<_i361.Dio>(() => serviceModule.dio);
    gh.factory<_i192.LogoutHandler>(() => _i935.LogoutHandlerImpl());
    gh.factory<_i702.OnboardingRepository>(
      () => _i37.OnboardingRepositoryImpl(),
    );
    gh.factory<_i192.AuthRepository>(() => _i157.AuthRepositoryImpl());
    gh.factory<_i370.DeleteAccountRepository>(
      () => _i777.DeleteAccountRepositoryImpl(),
    );
    gh.factory<_i588.SetShowOnboardingValueUseCase>(
      () =>
          _i588.SetShowOnboardingValueUseCase(gh<_i702.OnboardingRepository>()),
    );
    gh.factory<_i370.EditProfileRepository>(
      () => _i952.EditProfileRepositoryImpl(),
    );
    gh.factory<_i825.RemoteSubjectRepository>(
      () => _i142.RemoteSubjectRepositoryImpl(),
    );
    gh.factory<_i999.GetCurrentAuthStateUseCase>(
      () => _i999.GetCurrentAuthStateUseCase(gh<_i192.AuthRepository>()),
    );
    gh.factory<_i481.GetLoggedInUserUseCase>(
      () => _i481.GetLoggedInUserUseCase(gh<_i192.AuthRepository>()),
    );
    gh.factory<_i174.LoginWithEmailAndPasswordUseCase>(
      () => _i174.LoginWithEmailAndPasswordUseCase(gh<_i192.AuthRepository>()),
    );
    gh.factory<_i311.LogoutUseCase>(
      () => _i311.LogoutUseCase(gh<_i192.AuthRepository>()),
    );
    gh.factory<_i396.RegisterUserUseCase>(
      () => _i396.RegisterUserUseCase(gh<_i192.AuthRepository>()),
    );
    gh.factory<_i255.RemoteService>(() => _i203.RemoteServiceImpl());
    gh.factory<_i327.LocalBookmarkedExamRepository>(
      () => _i406.LocalBookmarkedExamRepositoryImpl(),
    );
    gh.factory<_i840.RemoteExamRepository>(
      () => _i893.RemoteExamRepositoryImpl(),
    );
    gh.factory<_i840.LocalExamSessionRepository>(
      () => _i700.LocalExamSessionRepositoryImpl(),
    );
    gh.singleton<_i93.ConnectivityHelper>(
      () => _i93.ConnectivityHelper(gh<_i895.Connectivity>()),
    );
    gh.factory<_i696.EditUserDataUsecase>(
      () => _i696.EditUserDataUsecase(gh<_i370.EditProfileRepository>()),
    );
    gh.factory<_i505.DioClient>(() => _i505.DioClient(gh<_i255.DioConfigs>()));
    gh.factory<_i878.DeleteAccountUseCase>(
      () => _i878.DeleteAccountUseCase(gh<_i370.DeleteAccountRepository>()),
    );
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
