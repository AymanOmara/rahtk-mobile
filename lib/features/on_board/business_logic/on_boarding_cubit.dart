import 'package:bloc/bloc.dart';
import 'package:domain/features/on_boarding/use_case/change_first_launch_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/features/on_board/display/on_board_slider_disply.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit(
    this._changeFirstLaunchUseCase,
  ) : super(OnBoardingInitial());
  final ChangeFirstLaunchUseCase _changeFirstLaunchUseCase;
  List<OnBoardingSliderDisplay> onBoardingSliders = [
    const OnBoardingSliderDisplay(
      title: "Empowering Artisans, Farmers & Micro Business",
      imagePath: "",
    ),
    const OnBoardingSliderDisplay(
      title: "Connecting NGOs, Social Enterprises with Communities",
      imagePath: "",
    ),
    const OnBoardingSliderDisplay(
      title: "Donate, Invest & Support infrastructure projects",
      imagePath: "",
    ),
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
