import 'package:show_up_app/models/enums/account_type.dart';
import 'package:show_up_app/providers/base_provider.dart';
import 'package:show_up_app/providers/shared_prefs_provider.dart';

class SelectAccountTypeProvider extends BaseProvider {
  AccountType? selectedType;

  void selectType(AccountType type) {
    selectedType = type;
    notifyListeners();
  }

  bool get canContinue => selectedType != null;

  Future<void> saveUserType(SharedPrefsProvider prefsProvider) async {
    if (selectedType == null) return;
    await prefsProvider.setUserType(selectedType!);
  }
}
