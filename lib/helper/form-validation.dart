class ValidationMixin {
  ValidationMixin();

  String? validateEmail(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter your email address';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(p0)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateTitle(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter your title';
    }
    return null;
  }

  String? validateBirthName(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter your birth name';
    }

    if (p0.split(' ').length < 2) {
      return 'Please enter your full birth name';
    }
    return null;
  }

  String? validateFirstAndLastName(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter correctly';
    }
    return null;
  }

  String? validateGenderSelected(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please select an appropriate gender';
    }
    return null;
  }
}
