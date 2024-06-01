import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/drugs/entity/drug_entity.dart';
import 'package:domain/features/drugs/use_case/add_periodically_reminder_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

part 'drug_details_state.dart';

class DrugDetailsCubit extends Cubit<DrugDetailsState> {
  DrugDetailsCubit(
    this.drugEntity,
    this._addPeriodicallyReminderUseCase,
  ) : super(DrugDetailsInitial());
  final AddPeriodicallyReminderUseCase _addPeriodicallyReminderUseCase;
  LoadingState loadingState = LoadingSuccess(data: "a");
  final DrugEntity drugEntity;
  String duration = "";

  void submit() {
    loadingState = Loading(showSuccessWidget: true);
    emit(DrugDetailsLoading());
    int durationInt = int.tryParse(duration) ?? 0;
    _addPeriodicallyReminderUseCase(drugEntity.id, durationInt).then((value) {
      loadingState = Idle();
      switch (value) {
        case Success(data: final data):
          emit(DrugDetailsResult(message: data.message, success: data.statusCode == 200));
          break;
        case Failure(exception: final exception):
          emit(DrugDetailsResult(message: exception.message, success: false));
          break;
      }
    });
  }
}
