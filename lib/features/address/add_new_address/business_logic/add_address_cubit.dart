import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/address_entity.dart';
import 'package:domain/features/order/entity/create_address_entity.dart';
import 'package:domain/features/order/use_case/create_address_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/i_add_able.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit(
    this._createAddressUseCase,
    this.addAble,
  ) : super(AddAddressInitial());
  final CreateAddressUseCase _createAddressUseCase;
  LoadingState loadingState = Idle();
  final IAddAble<AddressEntity> addAble;
  CreateAddressEntity entity = CreateAddressEntity();

  void createAddress() {
    loadingState = Loading();
    emit(AddAddressLoading());
    _createAddressUseCase(entity).then((value) {
      loadingState = Idle();
      switch (value) {
        case Success(data: final data):
          if(data.data != null){
            addAble.onAdd(data.data!);
          }
          emit(AddAddressResult(
            success: data.success,
            message: data.message,
            address: data.data,
          ));
          break;
        case Failure(exception: final exception):
          emit(AddAddressResult(success: false, message: exception.message));
      }
    });
  }
}
