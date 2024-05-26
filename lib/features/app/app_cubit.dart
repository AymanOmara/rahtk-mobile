import 'package:bloc/bloc.dart';
import 'package:domain/features/app/entities/user_status.dart';
import 'package:domain/features/app/use_case/get_user_status_use_case.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this._useCase) : super(AppInitial()) {
    userStatusEntity = _useCase();
  }

  final GetUserStatusUseCase _useCase;
  UserStatusEntity? userStatusEntity;
}
