enum AccountType {
  owner,
  attender,
}

extension AccountTypeExtension on AccountType {
  String get value {
    switch (this) {
      case AccountType.owner:
        return 'organizer';
      case AccountType.attender:
        return 'attendee';
    }
  }

  static AccountType fromValue(String value) {
    switch (value) {
      case 'organizer':
        return AccountType.owner;
      case 'attendee':
        return AccountType.attender;
      default:
        return AccountType.owner;
    }
  }
}
