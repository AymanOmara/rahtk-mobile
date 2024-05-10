import 'package:bloc/bloc.dart';

class RahtkBottomNavigationBarCubit extends Cubit<int> {
  RahtkBottomNavigationBarCubit() : super(0);

  void updateCurrentIndex(int index) {
    emit(index);
  }
}
