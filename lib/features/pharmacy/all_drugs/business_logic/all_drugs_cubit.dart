import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/drugs/entity/drug_entity.dart';
import 'package:domain/features/drugs/use_case/get_drugs_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

part 'all_drugs_state.dart';

class AllDrugsCubit extends Cubit<AllDrugsState> {
  AllDrugsCubit(
    this._getDrugsUseCase,
  ) : super(AllDrugsInitial()) {
    fetchDrugs();
  }

  LoadingState loadingState = Loading();
  final GetDrugsUseCase _getDrugsUseCase;
  List<DrugEntity> drugs = [];

  void fetchDrugs() {
    loadingState = Loading();
    emit(AllDrugsLoading());
    _getDrugsUseCase().then((value) {
      switch (value) {
        case Success(data: final data):
          loadingState = LoadingSuccess(data: data);
          drugs = data;
          emit(AllDrugsResult());
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(AllDrugsResult());
          break;
      }
    });
  }
}
