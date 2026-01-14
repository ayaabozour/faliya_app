enum AccountType {
  owner,
  attender,
}

extension AccountTypeExtension on AccountType {
  String get value {
    switch (this) {
      case AccountType.owner:
        return 'fixed_income';
      case AccountType.attender:
        return 'irregular_income';
    }
  }

  static AccountType fromValue(String value) {
    switch (value) {
      case 'fixed_income':
        return AccountType.owner;
      case 'irregular_income':
        return AccountType.attender;
      default:
        return AccountType.owner;
    }
  }
}
