import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/profile/entity/notification_entity.dart';
import 'package:domain/features/profile/use_case/get_notifications_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(
    this._getNotificationsUseCase,
  ) : super(NotificationsInitial()) {
    fetchNotifications();
  }

  final GetNotificationsUseCase _getNotificationsUseCase;
  LoadingState loadingState = Loading();
  List<NotificationEntity> notifications = [];

  void fetchNotifications() {
    loadingState = Loading();
    emit(NotificationsLoading());
    _getNotificationsUseCase().then((value){
      switch(value){
        case Success(data:final data):
          notifications = data;
          loadingState = LoadingSuccess(data: data);
          emit(NotificationsResult());
        case Failure(exception:final exception):
          loadingState = LoadingException(exception);
          emit(NotificationsResult());
      }
    });
  }
}
