import 'package:bloc/bloc.dart';
import 'package:common/logger.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/use_case/get_all_products_use_case.dart';
import 'package:domain/features/reminder/entity/reminder_entity.dart';
import 'package:domain/features/reminder/entity/update_reminder_entity.dart';
import 'package:domain/features/reminder/use_case/delete_reminder_use_case.dart';
import 'package:domain/features/reminder/use_case/update_reminder_use_case.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display_mapper.dart';
import 'package:rahtk_mobile/features/reminders/update_reminder/display/update_reminder_display.dart';

part 'update_reminder_state.dart';

class UpdateReminderCubit extends Cubit<UpdateReminderState> {
  UpdateReminderCubit(
    this.updateReminderDisplay,
    this._getAllProductsUseCase,
    this._deleteReminderUseCase,
    this._updateReminderUseCase,
  ) : super(UpdateReminderInitial()) {
    reminder = updateReminderDisplay.reminder;
    fetchProducts();
  }
  final UpdateReminderDisplay updateReminderDisplay;
  late ReminderEntity reminder;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final UpdateReminderUseCase _updateReminderUseCase;
  final DeleteReminderUseCase _deleteReminderUseCase;
  List<ProductDisplay> products = [];
  LoadingState productsLoading = Loading();
  LoadingState reminderLoading = Idle();

  void fetchProducts() {
    productsLoading = Loading();
    emit(UpdateReminderLoading());
    _getAllProductsUseCase().then((value) {
      switch (value) {
        case Success(data: final data):
          products = data.map((e) => e.toDisplay()).toList();
          Logger.D(reminder.products.length);
          for (var product in reminder.products) {
            var reminderProduct = products.firstWhereOrNull((pr) => pr.id == product.id);
            if (reminderProduct != null) {
              reminderProduct.selected = true;
            }
          }
          productsLoading = LoadingSuccess(data: data);
          emit(UpdateReminderLoading());
          break;
        case Failure(exception: final exception):
          productsLoading = LoadingException(exception);
          emit(UpdateReminderLoading());
          break;
      }
    });
  }

  void updateReminder() {
    reminderLoading = Loading();
    emit(UpdateReminderLoading());
    _updateReminderUseCase(_reminderEntity()).then((value) {
      switch (value) {
        case Success(data: final data):
          reminderLoading = LoadingSuccess(data: data);
          if (data.data != null) {
            updateReminderDisplay.updateAble.onUpdate(data.data!);
          }
          for(var product in products){
            product.selected = false;
          }
          emit(UpdateReminderResult(
            success: data.success,
            message: data.message,
          ));
          break;
        case Failure(exception: final exception):
          reminderLoading = LoadingException(exception);
          emit(
            UpdateReminderResult(
              success: false,
              message: exception.message,
            ),
          );
          break;
      }
    });
  }

  void deleteReminder() {
    reminderLoading = Loading();
    emit(UpdateReminderLoading());
    _deleteReminderUseCase(_reminderEntity()).then((value) {
      switch (value) {
        case Success(data: final data):
          reminderLoading = LoadingSuccess(data: data);
          if (data.data != null) {
            updateReminderDisplay.updateAble.onRemove(reminder);
          }
          emit(
            UpdateReminderResult(
              success: data.success,
              message: data.message,
            ),
          );
          break;
        case Failure(exception: final exception):
          reminderLoading = LoadingException(exception);
          emit(
            UpdateReminderResult(
              success: false,
              message: exception.message,
            ),
          );
          break;
      }
    });
  }

  void selectProduct(ProductDisplay product) {
    product.selected = !product.selected;
    emit(UpdateReminderUpdateSelectedProduct());
  }

  UpdateReminderEntity _reminderEntity() {
    return UpdateReminderEntity(
      id: reminder.id,
      title: reminder.title,
      timeInterval: reminder.timeInterval,
      products: products
          .where((p) => p.selected)
          .toList()
          .map((e) => e.toEntity)
          .toList(),
    );
  }
}
