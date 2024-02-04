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

  String? validateDateOfBirth(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please select your date of birth';
    }

    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateTime.parse(p0);

    // Calculate age
    int age = currentDate.year - birthDate.year;

    // Adjust age if birthday hasn't occurred yet this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    // Check if age is less than 18
    if (age < 18 || p0 != birthDate.toString()) {
      return 'You must be at least 18 years old';
    }

    return null;
  }

}
