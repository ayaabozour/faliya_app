class Validator {
  String? emailValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (!RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    ).hasMatch(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (value!.length < 8) {
      return 'Password must have at least 8 characters';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (value!.length < 8 || value.length > 15) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (value!.length < 2) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? numberValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (double.tryParse(value!) == null || double.parse(value) < 0) {
      return 'Please enter a valid number';
    }
    return null;
  }

  String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required field';
    }
    return null;
  }
}
