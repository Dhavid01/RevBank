import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:revbank/core/utils/base_viewmodel.dart';

class DashboardScreenViewModel extends BaseViewModel {
  final Ref ref;
  DashboardScreenViewModel(this.ref) {
    _persistentTabController = PersistentTabController(
      initialIndex: _currentIndex,
    );
  }
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  late PersistentTabController _persistentTabController;

  PersistentTabController get persistentTabController =>
      _persistentTabController;

  void jumpToTab(int index) {
    _persistentTabController.jumpToTab(index);
  }

  void setIndex(int v) {
    _currentIndex = v;
    notifyListeners();
  }

  void resetActiveIndex() {
    _currentIndex = 0;

    if (_persistentTabController.index != 0) {
      _persistentTabController.jumpToTab(0);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _persistentTabController.dispose();
    super.dispose();
  }
}

final dashboardScreenViewModel =
    ChangeNotifierProvider<DashboardScreenViewModel>((ref) {
  return DashboardScreenViewModel(ref);
});
