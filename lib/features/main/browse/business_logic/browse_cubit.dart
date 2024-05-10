import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'browse_state.dart';

class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit() : super(BrowseInitial());
}
