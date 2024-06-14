import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/entity/add_reminder_entity.dart';
import 'package:domain/features/product/use_case/get_all_products_use_case.dart';
import 'package:domain/features/reminder/entity/reminder_entity.dart';
import 'package:domain/features/reminder/use_case/add_periodically_reminder_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/i_add_able.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display_mapper.dart';

part 'add_reminder_state.dart';

class AddReminderCubit extends Cubit<AddReminderState> {
  AddReminderCubit(
    this.onSuccess,
    this._addPeriodicallyReminderUseCase,
    this._getAllProductsUseCase,
  ) : super(AddReminderInitial()) {
    fetchProducts();
  }
  String title = "";
  int timeInterval = 0;
  List<ProductDisplay> products = [];
  LoadingState productsLoading = Loading();
  LoadingState addReminderLoading = Idle();

  final AddPeriodicallyReminderUseCase _addPeriodicallyReminderUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final IAddAble<ReminderEntity> onSuccess;

  void fetchProducts() {
    productsLoading = Loading();
    emit(AddReminderLoading());
    _getAllProductsUseCase().then((value) {
      switch (value) {
        case Success(data: final data):
          products = data.map((e) => e.toDisplay()).toList();
          productsLoading = LoadingSuccess(data: data);
          emit(AddReminderLoading());
          break;
        case Failure(exception: final exception):
          productsLoading = LoadingException(exception);
          emit(AddReminderLoading());
          break;
      }
    });
  }

  void addReminder() {
    addReminderLoading = Idle();
    _addPeriodicallyReminderUseCase(_reminderEntity()).then((value) {
      switch (value) {
        case Success(data: final data):
          addReminderLoading = LoadingSuccess(data: data);
          if(data.data != null){
            onSuccess.onAdd(data.data!);
          }
          emit(AddReminderResult(success: data.success, message: data.message));
          break;
        case Failure(exception: final exception):
          addReminderLoading = LoadingException(exception);
          emit(AddReminderResult(success: false, message: exception.message));
          break;
      }
    });
  }

  void selectProduct(ProductDisplay product){
    product.selected = !product.selected;
    emit(AddReminderUpdateSelectedProduct());
  }
  AddReminderEntity _reminderEntity() {
    return AddReminderEntity(
      title: title,
      timeInterval: timeInterval,
      products: products.where((p)=>p.selected).toList().map((e)=> e.toEntity).toList(),
    );
  }
}
