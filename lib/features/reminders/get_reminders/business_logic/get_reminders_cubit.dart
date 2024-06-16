import 'package:bloc/bloc.dart';
import 'package:common/logger.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/reminder/entity/reminder_entity.dart';
import 'package:domain/features/reminder/use_case/get_reminders_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/i_add_able.dart';
import 'package:rahtk_mobile/core/display/i_update_able.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/core/helper/utils.dart';

part 'get_reminders_state.dart';

class GetRemindersCubit extends Cubit<GetRemindersState> implements IAddAble<ReminderEntity>, IUpdateAble<ReminderEntity> {
  GetRemindersCubit(
    this._getRemindersUseCase,
  ) : super(GetRemindersInitial()){
    fetchReminders();
  }
  List<ReminderEntity> reminders = [];
  final GetRemindersUseCase _getRemindersUseCase;
  LoadingState loadingState = Loading();
  void fetchReminders() {
    _getRemindersUseCase().then((value) {
      switch (value) {
        case Success(data: final data):
          reminders = data;
          loadingState = LoadingSuccess(data: data);
          emit(GetRemindersResult());
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(GetRemindersResult());
          break;
      }
    });
  }

  @override
  void onAdd(ReminderEntity item) {
    reminders.add(item);
    emit(GetRemindersResult());
  }

  @override
  void onRemove(ReminderEntity item) {
    reminders.remove(item);
    emit(GetRemindersResult());
  }

  @override
  void onUpdate(ReminderEntity item) {
    reminders.updateWhere((e)=> e.id == item.id, item);
    emit(GetRemindersResult());
  }
}
