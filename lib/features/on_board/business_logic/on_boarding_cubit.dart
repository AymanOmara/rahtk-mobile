import 'package:bloc/bloc.dart';
import 'package:domain/features/on_boarding/use_case/change_first_launch_use_case.dart';
import 'package:meta/meta.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit(
    this._changeFirstLaunchUseCase,
  ) : super(OnBoardingInitial());
  final ChangeFirstLaunchUseCase _changeFirstLaunchUseCase;
  List<String> onBoardingSliders = [
    "Empowering Artisans, Farmers & Micro Business",
    "Connecting NGOs, Social Enterprises with Communities",
    "Donate, Invest & Support infrastructure projects",
  ];
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(OnBoardingUpdateCurrentSliderIndex());
  }

  void updateFirstLaunch() {
    _changeFirstLaunchUseCase();
  }
}
