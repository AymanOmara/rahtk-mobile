import 'package:bloc/bloc.dart';
import 'package:common/logger.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/use_case/get_favorites_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/core/helper/fire_base_helper.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';

part 'bar_icons_state.dart';

class BarIconsCubit extends Cubit<BarIconsState> {
  BarIconsCubit(
    this._getFavoritesUseCase,
  ) : super(BarIconsInitial()) {
    fetch();
    addNotificationListener();
  }

  final GetFavoritesUseCase _getFavoritesUseCase;
  LoadingState loadingState = Idle();
  List<ProductDisplay> favorites = [];
  List<ProductDisplay> cartProducts = [];
  int notification = 0;

  void fetch() {
    loadingState = Loading();
    emit(BarIconsLoading());
    _getFavoritesUseCase().then((value) {
      switch (value) {
        case Success(data: final data):
          loadingState = Idle();
          favorites = data.map((e) => e.toDisplay()).toList();
          emit(BarIconsResult());
          break;
        case Failure(exception: final _):
          loadingState = Idle();
          emit(BarIconsResult());
          break;
      }
    });
  }

  void addNotificationListener() {
    FirebaseNotifications.notificationStreamController.stream.listen((event) {
      notification = event;
      Logger.D("event $event");
      emit(BarIconsLoading());
    });
  }

  void updateFavorites(List<ProductDisplay> products) {
    favorites = products;
    Logger.D("updateFavorites");
    emit(BarIconsUpdateFavorites());
  }
  void updateCartProducts(List<ProductDisplay> products) {
    cartProducts = products;
    Logger.D("updateCartProducts");
    emit(BarIconsUpdateFavorites());
  }
}
