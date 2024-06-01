import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/profile/entity/profile_entity.dart';
import 'package:domain/features/profile/use_case/change_language_use_case.dart';
import 'package:domain/features/profile/use_case/get_profile_info_use_case.dart';
import 'package:domain/features/profile/use_case/logout_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._getProfileInfoUseCase,
    this._logoutUseCase,
    this._changeLanguageUseCase,
  ) : super(ProfileInitial()) {
    getProfile();
  }

  ProfileEntity? profileEntity;
  final GetProfileInfoUseCase _getProfileInfoUseCase;
  final LogoutUseCase _logoutUseCase;
  final ChangeLanguageUseCase _changeLanguageUseCase;
  LoadingState loadingState = Loading();

  void getProfile() {
    loadingState = Loading();
    emit(ProfileLoading());
    _getProfileInfoUseCase().then((value) {
      switch (value) {
        case Success(data: final data):
          profileEntity = data;
          loadingState = LoadingSuccess(data: data);
          emit(ProfileResult());
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(ProfileResult());
          break;
      }
    });
  }

  void changeLanguage(String locale) {
    _changeLanguageUseCase(locale);
  }

  void logout() {
    loadingState = Loading();
    emit(ProfileLoading());
    _logoutUseCase().then((value){
      switch(value){
        case Success(data: final data):
          loadingState = LoadingSuccess(data: data);
          emit(ProfileLogoutResult(message: data.message, success: true));
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(ProfileLogoutResult(message: exception.message, success: false));
          break;
      }
    });
  }
}
