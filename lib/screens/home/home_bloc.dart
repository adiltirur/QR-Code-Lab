import '../../core/services/bloc.dart';
import 'home_state.dart';

class HomeBloc extends WBBloc<HomeState, HomeEvent> {
  void onTapBottomNavigationBar(WBBottomNavigationItem item) {
    emitS(
      state: currentState.copyWith(
        selectedItem: item,
      ),
    );
  }

  HomeBloc()
      : super(
          const HomeState(
            selectedItem: WBBottomNavigationItem.scan,
          ),
        );
}
