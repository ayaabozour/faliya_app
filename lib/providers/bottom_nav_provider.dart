import 'base_provider.dart';

class BottomNavProvider extends BaseProvider {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
